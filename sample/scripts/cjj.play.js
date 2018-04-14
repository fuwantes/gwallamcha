var Jumper  = function() {};
Jumper.Play = function() {};

Jumper.Play.prototype = {

	preload: function() {
		this.load.image('hero',  'assets/hero.png');
		this.load.image('enemy', 'assets/enemy.png');
		this.load.image('tile',  'assets/tile-1.png');
		this.load.image('candy', 'assets/tile-2.png');
		this.load.image('spring','assets/tile-3.png');
	},

	create: function() {

		// background color
		this.stage.backgroundColor = '#6bf';

		// scaling
		this.scale.scaleMode 	= Phaser.ScaleManager.SHOW_ALL;
		this.scale.maxWidth 	= this.game.width;
		this.scale.maxHeight 	= this.game.height;

		this.scale.pageAlignHorizontally = true;
		this.scale.pageAlignVertically 	 = true;

		this.scale.setScreenSize(true);

		// physics
		this.physics.startSystem(Phaser.Physics.ARCADE);

		// tracking vars
		this.camera_y_min 			= 99999;
		this.platform_y_min 		= 99999;
		this.platform_y_step		= 40.00;
		this.player_velocity_y_step = 0.00;
		this.shot_timer 			= 0;
		this.counter				= 1;
		this.test_bool 				= false;

		// create platforms
		this.create_platforms();

		//create springs/trampolines
		this.create_springs();

		// create hero
		this.create_hero();

		// create weapon
		this.create_candies();

		//create enemies
		this.create_enemies();


		// cursor controls
		this.cursor 	= this.input.keyboard.createCursorKeys();
		this.spacebar 	= this.input.keyboard.addKey(Phaser.Keyboard.SPACEBAR);
		this.enterKey 	= this.input.keyboard.addKey(Phaser.Keyboard.ENTER);

	},

	update: function() {
		
		this.world.setBounds(0, -this.hero.y_change, this.world.width, this.game.height + this.hero.y_change);

		this.camera_y_min 	= Math.min(this.camera_y_min, this.hero.y - this.game.height + 130);
		this.camera.y 		= this.camera_y_min;

		// hero collisions and movement
		this.physics.arcade.collide(this.hero, this.platforms, null, null, this);
		this.physics.arcade.collide(this.hero, this.springs, this.bounce_player, null, this);
		this.physics.arcade.collide(this.hero, this.enemies, this.bounce_enemy, null, this);
		this.physics.arcade.overlap(this.hero, this.enemies, this.remove_player, null, this);
		this.physics.arcade.overlap(this.candies, this.enemies, this.remove_enemy, null, this);
		this.create_movement_hero();

		// for each platform, find out which is the highest
		// if one goes below the camera view, then create a new one at a distance from the highest one
		this.platforms.forEachAlive(function(elem) {
			this.platform_y_min = Math.min(this.platform_y_min, elem.y);
			if(elem.y > this.camera.y + this.game.height) {
				elem.kill();
				this.counter += 1;
				if (this.counter >= 10) {
					this.platform_y_step += 0.5;
				}

				var random_tile  = this.rnd.integerInRange(1, 3);
				var random_event = this.rnd.integerInRange(0, 20);
				var random_x 	 = this.rnd.integerInRange(0, this.world.width - 50);
				var random_y 	 = this.platform_y_min - this.platform_y_step;
				
				this.create_platform(random_x, random_y, 50, random_tile);
				// to create more difficult platforms, tweak only the y parameter, create a step
				if (random_event % 3 == 0) {
					this.create_spring(random_x, random_y, this.rnd.integerInRange(1, 2));
				}
				else if (random_event % 10 == 0) {
					this.create_enemy(random_x, random_y);
				}
			}
		}, this);

	},

	render: function() {
		//game.debug.spriteInfo(this.hero, 15, 30);
	},

	shutdown: function() {
		// reset everything, or the world will be messed up
		this.world.setBounds(0, 0, this.game.width, this.game.height);
		
		this.platforms.destroy();
		this.springs.destroy();
		this.candies.destroy();
		this.enemies.destroy();
		this.hero.destroy();

		this.platforms 	= null;
		this.candies 	= null;
		this.cursor 	= null;
		this.hero 		= null;
	},

	/**
	*
	*	AUXILLARY FUNCTIONS
	*	
	**/

	create_hero: function() {
		// basic hero setup
		this.hero = game.add.sprite(this.world.centerX, this.world.height - 36, 'hero');
		this.hero.anchor.set(0.5);

		// track where the hero started and how much the distance has changed from that point
		this.hero.y_orig 	= this.hero.y;
		this.hero.y_change 	= 0;

		// hero collision setup
		this.physics.arcade.enable(this.hero);
		this.hero.body.gravity.y 			= 500;
		this.hero.body.checkCollision.up 	= false;
		this.hero.body.checkCollision.left	= false;
		this.hero.body.checkCollision.right = false;
	},

	create_platforms: function() {
		this.platforms 				= this.add.group();
		this.platforms.enableBody 	= true;
		this.physics.arcade.enable(this.platforms);

		// create base platform
		this.create_platform(-16, this.world.height - 16, this.world.width + 16, 1);

		// create first ten platforms
		for(var i = 0; i < 15-1; i++) {
		 	this.create_platform(this.rnd.integerInRange(0, this.world.width - 50), this.world.height - this.platform_y_step - this.platform_y_step * i, 50, 1);
		}
	},

	create_platform: function(x, y, width, type) {
		
		var platform;
		var image;

		switch (type) {
			case 1: image = 'tile' ; break;
			case 2: image = 'candy'; break;
			case 3: image = 'candy'; break;
			default: break;
		}

		platform = this.platforms.getFirstDead();
		platform = this.platforms.create(x, y, image);

		platform.body.immovable = true;
		platform.scale.x 		= width;
		platform.scale.y 		= 16;
		
		return platform;
	},

	create_springs: function() {
		this.springs 			= this.add.group();
		this.springs.enableBody = true;
		this.physics.arcade.enable(this.springs);
	},

	create_spring: function(x, y, type) {
		var spring;
		var pos_x 	= 0;
		var scale_x = 0;
		var scale_y = 15;

		switch (type) {
			case 1: 
				var rand_pos = 0;
				scale_x 	 = 15; 
				rand_pos 	 = (this.rnd.integerInRange(1, 2) == 1 ? scale_x/2 + 5 : scale_x/2 + 30);
				pos_x 		 = x + rand_pos; 
				break;
			case 2: 
				scale_x = 30; 
				pos_x 	= x + scale_x/2 + 10 - 0.5; 
				break;
			default: 
				scale_x = 15; 	
				break;
		}
	
		spring = this.springs.create(pos_x, y - scale_y/2, 'spring');
		this.physics.arcade.enable(spring);

		spring.scale.x = scale_x;
		spring.scale.y = scale_y;
		spring.body.immovable = true;
		spring.anchor.setTo(0.5, 0.5);
	},

	
	create_candies: function() {
		this.candies = this.add.group();
		this.physics.arcade.enable(this.candies);
	},

	create_candy: function() {

		var candy;
		candy = this.candies.create(this.hero.body.x + this.hero.body.width/2, this.hero.body.y + this.hero.body.height/2 - 4, 'candy');
		this.physics.arcade.enable(candy);
		candy.anchor.setTo(0.5, 0.5);

		candy.scale.x = 10;
		candy.scale.y = 10;
		candy.body.velocity.x = 0;
		candy.body.velocity.y = -500;
		candy.outOfBoundsKill = true;
	},

	create_enemies: function() {
		this.enemies 			= this.add.group();
		this.enemies.enableBody = true;
		this.physics.arcade.enable(this.enemies);
	},

	create_enemy: function(x, y) {
		var enemy;
		enemy = this.enemies.create(x + 12, y - 40, 'enemy');	
		enemy.body.immovable = true;
		enemy.outOfBoundsKill= true;
	},

	create_movement_hero: function() {
		// handle the left and right movement of the hero

		if 		(this.cursor.left.isDown)  {
			this.hero.body.velocity.x = -200;
		} 
		else if (this.cursor.right.isDown) {
		  	this.hero.body.velocity.x = 200;
		} 
		else {
		  	this.hero.body.velocity.x = 0;
		}

		// handle hero jumping
		if(this.hero.body.touching.down) {
			if (this.counter >= 10) {
				this.player_velocity_y_step += 0.02;
			}
		  	this.hero.body.velocity.y = -400 + this.player_velocity_y_step;
		}
		
		// spacebar to shoot
		if (this.spacebar.isDown) {
			this.shoot_candy();
		}

		// pause game
		window.onkeydown = function(evt) {
			if (evt.keyCode == 13) game.paused = (game.paused ? false : true);
		}
		
		// wrap game world for hero
		this.world.wrap(this.hero, this.hero.width/2, false);

		// track the maximum amount that the hero has travelled
		this.hero.y_change = Math.max( this.hero.y_change, Math.abs( this.hero.y - this.hero.y_orig ) );

		// if the hero falls below the camera view, gameover
		if (this.hero.y > this.camera_y_min + this.game.height && this.hero.alive) {
		  	this.game_over();
		}
	},

	shoot_candy: function() {
		if (this.shot_timer < game.time.now) {
			this.shot_timer = game.time.now + 250;
			this.create_candy();
		}
	},

	remove_platform: function(hero, platform) {
		platform.kill();
	},

	remove_enemy: function(candy, enemy) {
		enemy.kill();	
		candy.kill();
	},

	reset_velocity: function() {
		this.hero.body.acceleration.y = 0;
		this.hero.body.gravity.set(0, 500);		
	},

	bounce_player: function (hero, spring) {
		this.hero.body.acceleration.y = -50;
		this.hero.body.gravity.set(0, 300);
		this.time.events.add(Phaser.Timer.SECOND * 1, this.reset_velocity, this);
	},

	bounce_enemy: function(hero, enemy) {
		enemy.kill();
		this.bounce_player(this.hero, this.springs);
	},

	remove_player: function(hero, enemy) {
		this.hero.body.checkCollision.up 	= true;
		this.hero.body.checkCollision.down 	= false;
	},

	game_over: function() {
		game.state.start('Play');
	}
};
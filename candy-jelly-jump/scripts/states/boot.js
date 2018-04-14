var Boot = function(game) {}
Boot.prototype = {
	create: function () {
		game.physics.startSystem(Phaser.Physics.Arcade);
		game.state.start('load');
	}
}
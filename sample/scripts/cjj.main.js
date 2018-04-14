var game = new Phaser.Game(300, 500, Phaser.CANVAS, '');

game.state.add('Play', Jumper.Play);
game.state.start('Play');
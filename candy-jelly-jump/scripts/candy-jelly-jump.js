// i recommend this simple tutorial on getting em states
// http://perplexingtech.weebly.com/game-dev-blog/using-states-in-phaserjs-javascript-game-developement
// 
var game = new Phaser.Game(800, 600, Phaser.AUTO, 'div-game', null);

game.state.add('boot',  Boot);
game.state.add('load',  Load);
game.state.add('menu',  Menu);
game.state.add('play',  Play);
game.state.add('shop',  Shop);
game.state.add('style', Style);
game.state.add('score-over', Score_Over);
game.state.add('score-view', Score_View);

game.state.start('boot');
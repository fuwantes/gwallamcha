var Menu = function(game) {}
Menu.prototype = {
	preload: function() {
		// load your assets for the menu screen
	},
	create: function() {
		// do something that will call the game? 
		game.state.start('play');
	}
}
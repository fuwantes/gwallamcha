var Load = function(game) {} 
Load.prototype = {
	preload: function() {
		// load your assets for the loading screen
	},
	create: function() {
		game.state.start('menu');
	}
}
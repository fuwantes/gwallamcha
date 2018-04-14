<?php

/*
* 
	CHECKLIST
 
	PRELOAD (basic)
		background
		tiles 		-> basic tiles
		sprite 		-> main player
		animations 	-> main player
	CREATE (basic)
		platforms 	
			-> randomization
				-> tile types:
					-> normal 		-> 1
					-> breakable 	-> 2
					-> disappearing -> 3
					-> explosive 	-> 4
					-> moving 		-> 5
		player
			-> movement
				-> detect if laptop, or mobile (based on os)
				-> if mobile, touch and tilt input
*
*/

?>
<html>
<head>
	<title>Candy Jelly Jump</title>
	<link  	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<script src ="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script>
	<script src ="https://cdnjs.cloudflare.com/ajax/libs/phaser/2.0.5/phaser.min.js"></script>
	<script src ="scripts/cjj.play.js"></script>
	<script src ="scripts/cjj.main.js"></script>
</head>
<body>
</body>
</html>
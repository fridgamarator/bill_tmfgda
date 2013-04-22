$ ->
	HEIGHT = 320 * 2
	WIDTH = 480 * 2

	Crafty.init()
	Crafty.viewport.init WIDTH, HEIGHT
	Crafty.viewport.clampToEntities = false	

	Crafty.scene 'Loading'
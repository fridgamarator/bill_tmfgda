Crafty.c 'green_mushroom',
	init: ->
		@addComponent "2D, DOM, SpriteAnimation, GreenMushroom, Collision"
		@attr {x: 400, y: 297, z: 10}
		@animate 'die', 4, 6, 7
		@collision()
		@bind 'AnimationEnd', (data) =>
			@destroy() if @._currentReelId == "die"
	die: ->
		@animate('die', 12, 0)
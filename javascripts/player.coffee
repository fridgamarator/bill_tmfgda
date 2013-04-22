Crafty.c 'billbill', 
	facing: 'e'
	init: ->
		@addComponent("2D, DOM, SpriteAnimation, Twoway, Keyboard, Collision, Gravity, shoot, Bill")
		@attr({x: 10, y: 100, z: 10})
		@animate('walk_right', 0, 0, 3)
		@animate('walk_left', 0, 0, 3)
		@twoway(4)
		@gravity('ground')
		@collision()
		@gravityConst(0.5)
		@bind 'Moved', (from) ->
			@attr({x: from.x, y: from.y}) if @hit('ground')
		@bind 'NewDirection', (direction) ->
			@stop().animate('walk_right', 12, -1).attr({facing: 'e'}).unflip() if direction.x > 0 && !@isPlaying 'walk_right'
			@stop().animate('walk_left', 12, -1).attr({facing: 'w'}).flip() if direction.x < 0 && !@isPlaying 'walk_left'
			@stop() if !direction.x && !direction.y
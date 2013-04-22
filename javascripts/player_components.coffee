Crafty.c 'bullet',
	bullet: (dir, entity) ->
		@bind 'EnterFrame', ->
			@move dir, 30
			@destroy() if @x > entity.x + (Crafty.viewport.width / 2) + 10 || @x < entity.x - (Crafty.viewport.width / 2) - 10
			else
				@onHit 'green_mushroom', (ent) ->
					@.destroy()
					ent[0].obj.die()
				@onHit 'ground', ->
					@.destroy()

Crafty.c 'shoot',
	init: ->
		@bind 'KeyDown', (e) =>
			if Crafty.keys.SPACE == e.key
				bulletY = @y + 8
				bulletX = @x + 5 if @.facing == 'e'
				bulletX = @x - 5 if @.facing == 'w'
				Crafty.e("2D, DOM, Collision, bullet, gun").attr({x: bulletX, y: bulletY, z: 50}).bullet(@facing, @)
				Crafty.audio.play 'lasergun', 1, .3
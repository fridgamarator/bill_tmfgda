Crafty.scene 'world_one', ->
	Crafty.audio.stop 'gemini'
	Crafty.audio.play 'digitalis', -1

	clearTimeout window.pressSpace

	Crafty.e("2D, DOM, TiledMapBuilder").setMapDataSource(WORLD_ONE_SOURCE).createWorld (tiledMap) ->
		for ground in tiledMap.getEntitiesInLayer('ground')
			t = tiledMap
			t.getEntitiesInLayer('ground')[ground]
			t.addComponent('Collision')
			t.collision()

	green_mushroom = Crafty.e 'green_mushroom'
	bill = Crafty.e 'billbill'
			


	Crafty.viewport.follow Crafty("billbill"), 0, 0
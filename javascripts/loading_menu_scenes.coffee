Crafty.scene "Loading", ->
	Crafty.background "#000"
	Crafty.e("2D, DOM, Text").attr({w: 640, h: 20, x: 0, y: 480 / 2}).text("Loading...").css({'text-align': 'center'})
	
	Crafty.load ['/images/allenemiessheet.png', '/images/projectiles.png', '/images/bill.png', '/images/bugtilesblue.png', '/images/astrosheet.png', 'lasergun.mp3', 'Gemini.mp3', 'digitalis.mp3'], ->
		Crafty.sprite 24, 24, '/images/astrosheet.png', {Bill: [0, 0]}
		Crafty.sprite 7, 7, '/images/projectiles.png', {gun: [4, 3]}
		Crafty.sprite 24, 24, '/images/allenemiessheet.png', {green_alien: [0, 0]}
		Crafty.sprite 24, 24, '/images/allenemiessheet.png', {GreenMushroom: [0, 6]}
		Crafty.audio.add
			gemini: ['Gemini.mp3']
			digitalis: ['digitalis.mp3']
			lasergun: ['lasergun.mp3']
		Crafty.scene 'Menu'

Crafty.scene 'Menu', ->
	billImg = Crafty.e("2D, DOM, Image, Tween").image('/images/bill.png').attr({x: 320, y: -300})
	billTxt = Crafty.e("2D, DOM, Text, Tween").attr({w: 640, h: 100, x: 150, y: 700}).text("THE MOTHER FUCKING GOD DAMN ASTRONAUGHT").css({'text-align': 'center'}).textColor('#FFFFFF').textFont({family: 'Arial'})
	Crafty.audio.play 'gemini', -1

	billImg.tween
		y: 100
	, 900

	setTimeout ->
		billTxt.tween
			y: 350
		, 900
	, 10000

	window.pressSpace = setTimeout ->
		spaceTxt = Crafty.e("2D, DOM, Text").attr({w: 640, h: 100, x: 150, y: 400}).text("PRESS SPACE TO PLAY").css({'text-align': 'center'}).textColor('#FFFFFF').textFont({family: 'Arial'})
		spaceTxt.bind 'KeyDown', (e) ->
			Crafty.scene 'world_one' if e.key == Crafty.keys.SPACE
		blink = ->
			setTimeout ->
				$(spaceTxt._element).fadeOut(300)
				$(spaceTxt._element).fadeIn(300)
				blink()
			, 600
		blink()
	, 30000

	# billImg.bind 'KeyDown', (e) ->
	# 	Crafty.scene 'world_one'
class Te3
	dificulty: 	 36 #Lower is harder
	timer: 			 0
	renderer: 		new Renderer
	scene: 	 		new Scene
	camera:	 		new Camera
	grid: 				new Grid

	constructor: ->
		@scene.add @camera
		@scene.add @grid
		@addBlock()
		@animate()
		window.onkeydown = @blockMovement

	addBlock: ->
		@scene.add @currentBlock = RandomBlock.choose()

	blockMovement: (event) =>
		switch event.keyCode
			when 37, 65
				@currentBlock.left()
			when 39, 68
				@currentBlock.right()
			when 40, 83
				@currentBlock.down() || @addBlock()
			when 38, 87
				@currentBlock.flip()

	animate: =>
		requestAnimationFrame( @animate )
		@timer++
		@currentBlock.down() || @addBlock() if @timer % @dificulty == 0
		@renderer.render(@scene, @camera)

new Te3

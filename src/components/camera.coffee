class Camera extends ComponentBase
  constructor: ->
    @component = new THREE.PerspectiveCamera( 45, Window.aspectRatio(), 1, 2000 );

    @component.position.z = GRID_WIDTH * 3
    @component.position.x = GRID_WIDTH / 2
    @component.position.y = GRID_HEIGHT / 2

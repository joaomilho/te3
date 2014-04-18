class Grid extends ComponentBase
  color: 0xbbbbbb

  constructor: ->
    @component = new THREE.Mesh(
      new THREE.CubeGeometry(GRID_WIDTH, GRID_HEIGHT, CUBE_SIZE),
      new THREE.MeshBasicMaterial({wireframe: true, color: @color})
    )
    @component.position.x = GRID_WIDTH / 2
    @component.position.y = GRID_HEIGHT / 2

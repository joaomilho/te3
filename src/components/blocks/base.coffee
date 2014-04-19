class BlockBase extends ComponentBase
  adjust: CUBE_SIZE / 2
  initialX: 4

  constructor: ->
    @component = @merge(@geometries())
    @x(@initialX * CUBE_SIZE)
    @y(TOP)
    @width = _.max _.map @format, ((row) -> _.countBy(row)[1])

  geometries: ->
    geometries = []
    y = 0
    for line in @format
      y++
      x = 0
      for row in line
        x++
        continue if row == 0
        geometry = @geometry()
        geometry.applyMatrix( new THREE.Matrix4().makeTranslation((x-2)*CUBE_SIZE, -(y-1)*CUBE_SIZE, 0) )
        geometries.push(geometry)
    geometries

  geometry: ->
    new THREE.CubeGeometry(CUBE_SIZE, CUBE_SIZE, CUBE_SIZE)

  merge: (geometries) ->
    firstGeometry = geometries.shift()
    for geometry in geometries
      THREE.GeometryUtils.merge(firstGeometry, geometry)
    material = new THREE.MeshBasicMaterial({wireframe: true, color: @color})
    @initialPosition(firstGeometry)

    new THREE.Mesh( firstGeometry, material )

  flip: ->
    # @component.rotation.z += Math.PI/2

  initialPosition: (geometry) ->
    x = @translateX || 0
    geometry.applyMatrix( new THREE.Matrix4().makeTranslation(25 + CUBE_SIZE * x, 25 + CUBE_SIZE * 3, 0) )

  y: (value) ->
    @component.position.y = value

  x: (value) ->
    @component.position.x = value

  down: ->
    @component.position.y -= CUBE_SIZE unless @bottomLimit()

  bottomLimit: ->
    @component.position.y <= BOTTOM

  left: ->
    @component.position.x -= CUBE_SIZE unless @leftLimit()

  leftLimit: ->
    @component.position.x <= LEFT

  right: ->
    @component.position.x += CUBE_SIZE unless @rightLimit()

  rightLimit: ->
    @component.position.x >= RIGHT - @width * CUBE_SIZE

class Renderer extends ComponentBase
  component: new THREE.WebGLRenderer antialias: true
  color: 0xcccccc

  constructor: ->
    @component.setSize(Window.w(), Window.h())
    @component.setClearColor( @color )

    document.body.appendChild(@component.domElement)

  render: (scene, camera) ->
    @component.render(scene.t(), camera.t())

class Scene extends ComponentBase
  component: new THREE.Scene

  add: (object) ->
    @component.add object.t()

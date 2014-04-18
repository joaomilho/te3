class Window
  @aspectRatio: ->
    @w() / @h()

  @w: ->
    window.innerWidth

  @h: ->
    window.innerHeight

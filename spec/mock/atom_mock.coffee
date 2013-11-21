exports.atom =

  width: 100
  height: 150

  context:
    setAlpha: ->
    fillRect: ->
    fillText: ->
    clearRect: ->
    arc: ->
    fill: ->
    beginPath: ->
    closePath: ->
    moveTo: ->
    bezierCurveTo: ->

  Game: class Game

  setDesiredSurfaceArea: ->

  input:
    _down: {}
    _pressed: {}
    _released: {}

    down: (action) -> @_down[action]
    pressed: (action) -> @_pressed[action]
    released: (action) -> @_released[action]

    press: (action) ->
      @_pressed[action] = true
      @_down[action] = true
      @_released[action] = false

    hold: (action) ->
      @_pressed[action] = false
      @_down[action] = true
      @_released[action] = false

    release: (action) ->
      @_pressed[action] = false
      @_down[action] = false
      @_released[action] = true

    reset: ->
      @_pressed = {}
      @_down = {}
      @_released = {}

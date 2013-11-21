{atom} = require "../spec/mock/atom_mock.coffee"
{keybindings} = require "./keybindings.coffee"
{util} = require "./util.coffee"

exports.Game = class Game extends atom.Game
  @SPEED = 300

  constructor: ->
    super
    keybindings.configure()
    atom.setDesiredSurfaceArea 500000
    @_maxTimeDifference = .075
    @_leftWidth = atom.width / 2

  update: (dt) ->
    dt = Math.min dt, @_maxTimeDifference
    if atom.input.down "left"
      @_leftWidth -= Game.SPEED * dt
    if atom.input.down "right"
      @_leftWidth += Game.SPEED * dt

    @_leftWidth = util.bound @_leftWidth, 0, atom.width

  draw: ->
    atom.context.fillStyle = "black"
    atom.context.fillRect 0, 0, atom.width, atom.height
    atom.context.fillStyle = "white"
    atom.context.fillRect 0, 0, @_leftWidth, atom.height

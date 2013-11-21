{atom} = require "../spec/mock/atom_mock.coffee"

exports.keybindings =
  configure: ->
    atom.input.bind atom.key.LEFT_ARROW, "left"
    atom.input.bind atom.key.A, "left"
    atom.input.bind atom.touch.SWIPE_LEFT, "left"

    atom.input.bind atom.key.RIGHT_ARROW, "right"
    atom.input.bind atom.key.D, "right"
    atom.input.bind atom.touch.SWIPE_RIGHT, "right"

    atom.input.bind atom.key.SPACE, "pause"
    atom.input.bind atom.touch.TAP, "pause"
    atom.input.bind atom.key.P, "pause"

{Game} = require "../coffee/game.coffee"
{test_environment} = require "../spec/mock/test_environment.coffee"

describe "A Game", ->
  game = undefined

  beforeEach ->
    test_environment.beforeEach(this);
    game = new Game

  it "", ->

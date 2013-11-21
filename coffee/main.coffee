game = new Game

handleEvents = ->
  window.onblur = -> game.stop()
  window.onfocus = -> game.run()
  $(window).on 'resize', => game.resize()

handleEvents();
game.run()

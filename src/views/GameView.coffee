class window.GameView extends Backbone.View

  tagName: "div",

  className: "game-container",

  initialize: -> 
    $('body').append @$el;
    @render()

  render: ->
    @$el.html "<p>(" + @model.get('playerWins') + ")</p>"

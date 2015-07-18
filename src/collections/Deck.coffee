class window.Deck extends Backbone.Collection
  model: Card

  initialize: ->
    @.generateDeck()
    @.on 'remove', ->
      @.length is 0 ?
        @.generateDeck()

  generateDeck: -> 
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  dealPlayer: -> new Hand [@pop(), @pop()], @

  dealDealer: -> new Hand [@pop().flip(), @pop()], @, true
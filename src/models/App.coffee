# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'game', new Game()
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand') .on 'hit', -> console.log "hit!"
    ""
    #add on 'stand' event on playerHand, it triggers dealerHand
    #initialize game, set current player to player ... 
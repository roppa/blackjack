# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'game', new Game()
    @get('game') .set 'deck', @.get('deck')
    @get('game') .set 'player', @.get('playerHand')
    @get('game') .set 'dealer', @.get('dealerHand')
    @get('playerHand').on('hit', (->@get('game').checkPlayerHand()), @)
    @get('playerHand').once('stand', (->@get('game').startDealer()), @)
    ""
    #add on 'stand' event on playerHand, it triggers dealerHand
    #initialize game, set current player to player ... 
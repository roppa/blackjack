# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'game', new Game()
    @get('game') .set 'player', @.get('playerHand')
    #@get('game') .set 'currentPlayer', 'player') chose to set this in game.initialize for now
    @get('game') .set 'dealer', @.get('dealerHand')
    @get('playerHand').on('hit', (->@get('game').checkHand()), @)
    @get('playerHand').once('stand', (->@get('game').startDealer()), @)
    ""
    #add on 'stand' event on playerHand, it triggers dealerHand
    #initialize game, set current player to player ... 
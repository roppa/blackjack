# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'game', new Game()
    @get('game') .set 'deck', @.get('deck')
    @newGame()
    # @get('game') .set 'player', @.get('playerHand')
    # @get('game') .set 'dealer', @.get('dealerHand')
    @get('playerHand').on('hit', (->@get('game').checkPlayerHand()), @)
    @get('playerHand').once('stand', (->@get('game').startDealer()), @)
    @listenTo @get('game'), 'reset', @.newGame
    ""
  newGame: ->
    console.log("called once")
    @set 'playerHand', @get('deck').dealPlayer()
    @set 'dealerHand', @get('deck').dealDealer()
    @get('game') .set 'player', @.get('playerHand')
    @get('game') .set 'dealer', @.get('dealerHand')
    @trigger 'reset'
    ""
    #add on 'stand' event on playerHand, it triggers dealerHand
    #initialize game, set current player to player ... 
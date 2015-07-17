class window.Game extends Backbone.Model
  defaults:
    "playerWins": 0
    "dealerWins": 0
    "winner": null
    "dealer" : null,
    "player" : null

  initialize: ->

  checkHand: ->
    #if player hand is bust
    #if player has stood
      #check dealer score
        #if dealer has blackjack they have won
        #if < 17, dealer hits
        #if > 21 dealer loses, player wins
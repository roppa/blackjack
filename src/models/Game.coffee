class window.Game extends Backbone.Model
  defaults:
    "playerWins": 0
    "dealerWins": 0
    "winner": null
    "dealer" : null
    "player" : null
    "status" : null

  initialize: ->
    #on change in dealer and player

  checkHand: ->
    console.log @.get('player').scores()
    if @.get('player').scores()[0] > 21 and @.get('player').scores()[1] > 21
      @.set "winner", "dealer"
      alert("player busts!")

    #if player hand is bust
    #if player has stood
      #check dealer score
        #if dealer has blackjack they have won
        #if < 17, dealer hits
        #if > 21 dealer loses, player wins
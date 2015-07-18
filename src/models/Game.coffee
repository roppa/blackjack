class window.Game extends Backbone.Model
  defaults:
    games: []
    playerWins: 0
    dealerWins: 0
    winner: null
    dealer : null
    player : null
    status : null
    dealerOrPlayer: null

  initialize: ->
    #on change in dealer and player
    @.set 'dealerOrPlayer', 'player'

  checkHand: ->
    #console.log @.get('player').scores()
    if @.get('player').scores()[0] > 21 and @.get('player').scores()[1] > 21
      @.set "winner", "dealer"
      alert "player busts! " + @.get('winner') + " wins!"
      @.get("games") .push @.get('winner')

  startDealer: ->
    console.log "dealer started"
    #sort this out
    @.get('dealer').at(0).flip()


    if @.get('dealer').scores()[0] is 21 or @.get('dealer').scores()[1] is 21
      @.set "winner", "dealer"
      alert "blackjack! dealer wins!"
    if @.get('dealer').scores()[0] > 21 and @.get('dealer').scores()[1] > 21
      alert("dealer loses! player wins!")
    if @.get('dealer').scores()[0] < 17 or @.get('dealer').scores()[1] < 17
      context = this
      setTimeout (->context.get('dealer').hit(); context.startDealer(); ""), 1000
    #Any Ace and picture card - blackjack - won
    #if dealer > player - dealer wins

    #if player hand is bust
    #if player has stood
      #check dealer score
        #if dealer has blackjack they have won
        #if < 17, dealer hits
        #if > 21 dealer loses, player wins
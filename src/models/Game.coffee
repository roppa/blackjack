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
    if @.get('dealer').at(0).get('revealed') is false
      @.get('dealer').at(0).flip()

    if @.get('dealer').scores()[0] is 21 or @.get('dealer').scores()[1] is 21
      @.alertWinner
    else if @.get('dealer').scores()[0] > 21 and @.get('dealer').scores()[1] > 21
      @.alertWinner "player", "dealer"
    else if @.get('dealer').scores()[0] > @.get('player').scores()[0]
      alert("player loses! dealer wins!")
    else if @.get('dealer').scores()[0] < 17 or @.get('dealer').scores()[1] < 17
      context = this
      setTimeout (->context.get('dealer').hit(); context.startDealer(); ""), 1000
  
  alertWinner: (winner, loser) ->
      @.set "winner", winner
      @.set winner + "Wins", @.get(winner + "Wins") + 1
      setTimeout (->alert("#{winner} loses! #{loser} wins!")), 200

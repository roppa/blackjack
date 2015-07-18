class window.Game extends Backbone.Model
  defaults:
    games: []
    deck: null
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

  checkPlayerHand: ->
    if @.get('player').scores()[0] > 21 and @.get('player').scores()[1] > 21
      @.set "winner", "dealer"
      @.alertWinner "dealer", "player"
      @.get("games") .push @.get('winner')

  startDealer: ->

    if @.get('dealer').at(0).get('revealed') is false
      @.get('dealer').at(0).flip()

    #if dealer has 21
    if @.get('dealer').scores()[0] is 21 or @.get('dealer').scores()[1] is 21
      @.alertWinner "dealer", "player"
    #if dealer is bust
    else if @.get('dealer').scores()[0] > 21 and @.get('dealer').scores()[1] > 21
      @.alertWinner "player", "dealer"
    #if dealers [0] score is better than players [0] score
    else if @.get('dealer').scores()[0] > @.get('player').scores()[0]
      @.alertWinner "dealer", "player"
    else if @.get('dealer').scores()[0] < 17 or @.get('dealer').scores()[1] < 17
      context = this
      setTimeout (->context.get('dealer').hit(); context.startDealer(); ""), 1000
    else
      @.compareHands()
      alert "some other condition"

  compareHands: ->
    if @.get('dealer').scores[0] > @.get('player').scores[0]
      @.alertWinner 'dealer', 'player'
    else
      @.alertWinner 'player', 'dealer'
  
  alertWinner: (winner, loser) ->
      @set "winner", winner
      @set winner + "Wins", @.get(winner + "Wins") + 1
      resetMethod = @.reset.bind(@)
      setTimeout (->alert("#{loser} loses! #{winner} wins!"); resetMethod(); ""), 200
      #consider removing the above once we have a way to display wins and losses on screen
  reset: ->
    @trigger 'reset', @
    ""
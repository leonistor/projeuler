###
Problem 54
Poker hands

In the card game poker, a hand consists of five cards and are ranked, from
lowest to highest, in the following way:

    High Card: Highest value card.
    One Pair: Two cards of the same value.
    Two Pairs: Two different pairs.
    Three of a Kind: Three cards of the same value.
    Straight: All cards are consecutive values.
    Flush: All cards of the same suit.
    Full House: Three of a kind and a pair.
    Four of a Kind: Four cards of the same value.
    Straight Flush: All cards are consecutive values of same suit.
    Royal Flush: Ten, Jack, Queen, King, Ace, in same suit.

The cards are valued in the order:
2, 3, 4, 5, 6, 7, 8, 9, 10, Jack, Queen, King, Ace.

If two players have the same ranked hands then the rank made up of the highest
value wins; for example, a pair of eights beats a pair of fives (see example 1
below). But if two ranks tie, for example, both players have a pair of queens,
then highest cards in each hand are compared (see example 4 below); if the
highest cards tie then the next highest cards are compared, and so on.

Consider the following five hands dealt to two players:
Hand    
Player 1    
Player 2    
Winner

1   
5H 5C 6S 7S KD
Pair of Fives    
2C 3S 8S 8D TD
Pair of Eights
Player 2

2   
5D 8C 9S JS AC
Highest card Ace
2C 5C 7D 8S QH
Highest card Queen
Player 1

3   
2D 9C AS AH AC
Three Aces
3D 6D 7D TD QD
Flush with Diamonds
Player 2

4   
4D 6S 9H QH QC
Pair of Queens
Highest card Nine
3D 6D 7H QD QS
Pair of Queens
Highest card Seven
Player 1

5   
2H 2D 4C 4D 4S
Full House
With Three Fours
3C 3D 3S 9S 9D
Full House
with Three Threes
Player 1

The file, poker.txt, contains one-thousand random hands dealt to two
players. Each line of the file contains ten cards (separated by a
single space): the first five are Player 1's cards and the last five
are Player 2's cards. You can assume that all hands are valid (no
invalid characters or repeated cards), each player's hand is in no
specific order, and in each hand there is a clear winner.

How many hands does Player 1 win?

###

_ = require './utils/underscore-min'
fs = require 'fs'

colors = [
  name:   "Spades"
  letter: "S"
  symbol: "\u2660"
,
  name:   "Heart"
  letter: "H"
  symbol: "\u2665"
,
  name:   "Diamond"
  letter: "D"
  symbol: "\u2666"
,
  name:   "Club"
  letter: "C"
  symbol: "\u2663"
]

# for c in colors
  # console.log c.name, c.symbol

CARDS = [
  '2', '3', '4', '5', '6', '7', '8', '9', 
  'T', #10 
  'J', #Jack 
  'Q', # Queen 
  'K', # King 
  'A' #Ace
]

ORDER = CARDS.join('')
# console.log order


# x = 'KH 6D 4C 4D TS'
# x = '2H 3H 4H 5H 6H'
# x = '7H 7H TH 9H 8D'
# x = '7H 7H 7H 9H 9D'
# x = x.split(' ')

isSameSuit = (cards) ->
  _.size( _.countBy( cards, (card) -> card[1] ) ) is 1
# console.log  isSameSuit(x)

isConsecutive = (cards) ->
  c = _.map( cards, (card) -> card[0] )
  c = _.sortBy( c, (card) -> _.indexOf(ORDER, card) )
  if ORDER.indexOf( c.join('') ) >= 0
    return true
  else
    return false
# console.log isConsecutive(['JH', '9H', 'TH'])

getPairs = (cards) ->
  c = _.countBy( cards, (card) -> card[0] )
  c = _.values(c).sort()
# console.log getPairs(x)

RANK = [
  name: 'Error'
  desc: 'Something is wrong'
  val:   0
,  
  name: 'High Card'
  desc: 'Highest value card.'
  val:  1
,  
  name: 'One Pair'
  desc: 'Two cards of the same value.'
  val:  2
,
  name: 'Two Pairs'
  desc: 'Two different pairs.'
  val:  3
,
  name: 'Three of a Kind'
  desc: 'Three cards of the same value.'
  val:  4
,
  name: 'Straight'
  desc: 'All cards are consecutive values.'
  val:  5
,
  name: 'Flush'
  desc: 'All cards of the same suit.'
  val:  6
,
  name: 'Full House'
  desc: 'Three of a kind and a pair.'
  val:  7
,
  name: 'Four of a Kind'
  desc: 'Four cards of the same value.'
  val:  8
,
  name: 'Straight Flush'
  desc: 'All cards are consecutive values of same suit.'
  val:  9
,
  name: 'Royal Flush'
  desc: 'Ten, Jack, Queen, King, Ace, in same suit.'
  val:  10
]

rank = (hand) ->
  cards = _.map( hand, (card) -> card[0] )
  cards = _.sortBy( cards, (card) -> _.indexOf(ORDER, card) )
  if isSameSuit(hand) and isConsecutive(hand) and cards[0] is 'T'
    return 10
  if isConsecutive(hand) and isSameSuit(hand)
    return 9

  pairs = getPairs(hand).toString()
  # console.log pairs

  if pairs is "1,4"
    return 8
  if pairs is "2,3"
    return 7
  if isSameSuit(hand)
    return 6
  if isConsecutive(hand)
    return 5
  if pairs is "1,1,3"
    return 4
  if pairs is "1,2,2"
    return 3
  if pairs is "1,1,1,2"
    return 2
  if pairs is "1,1,1,1,1"
    return 1
  return 0 # actually its error
# end rank

# test din enunt
games = [
  '5H 5C 6S 7S KD 2C 3S 8S 8D TD'
  # Pair of Fives    
  # Pair of Eights
  # Player 2
  ,
  '5D 8C 9S JS AC 2C 5C 7D 8S QH'
  # Highest card Ace
  # Highest card Queen
  # Player 1
  ,
  '2D 9C AS AH AC 3D 6D 7D TD QD'
  # Three Aces
  # Flush with Diamonds
  # Player 2
  ,
  '4D 6S 9H QH QC 3D 6D 7H QD QS'
  # Pair of Queens
  # Highest card Nine
  # Pair of Queens
  # Highest card Seven
  # Player 1
  ,
  '2H 2D 4C 4D 4S 3C 3D 3S 9S 9D'
  # Full House
  # With Three Fours
  # Full House
  # with Three Threes
  # Player 1
  ,
  '2H 2D JC KD JS 3C QD 3S QS 9D'
  # Two pairs
  # with Jacks and Twos
  # Two pairs
  # with Queens and Threes
  # Player 2
  ,
  '2H 2D JC KD JS JD 3C 3S JS 9D'
  # Two pairs
  # with Jacks and Twos
  # Two pairs
  # with Jacks and Threes
  # Player 2
  ,
  'JC KD JS 2H 2D 2C JD 2S JH 9D'
  # Two pairs
  # with Jacks and Twos, plus King
  # Two pairs
  # with Jacks and Twos, plus Nine
  # Player 1
  ,
  'JC KD KS KH 2D JS JD 2S JH 9D'
  # Three of a kind
  # with Kings
  # Three of a kind
  # with Jacks
  # Player 1
  ,
  '2C 3D 4S 5H 6D 8S 9D TS JH QD'
  # Straight
  # with Six
  # Straight
  # with Queen
  # Player 2
]

printPlayer = (player) ->
  console.log "#{player.name}: #{player.hand}"
  console.log RANK[player.rank].name

winsPlayer1 = 0
zeroPad = (num) ->
  (1e8 + num).toString().slice(-4)

# for test data
# for hands, index in games

# parse file, after manually delete last empty line :-)
fs.readFileSync('./data/poker.txt').toString().split('\n').
  forEach( (hands, index) ->

    winner = 0
    player1 = 
      name: 'Player 1'
      rank: 0
    player2 = 
      name: 'Player 2'
      rank: 0
    player1.hand = hands[0..13].split(' ')
    player2.hand = hands[15..].split(' ')
    # console.log "Game #{index+1} -------"
    for player in [player1, player2]
      player.rank = rank(player.hand)
      # printPlayer player
    if player1.rank > player2.rank
      winner = 1
    else if player1.rank < player2.rank
      winner = 2
    else
      # console.log "TIE"
      # start digging
      # ugly as unfucked
      cards1 = _.map( player1.hand, (card) -> card[0] )
      sorted1 = _.sortBy(cards1, (card) -> _.indexOf(ORDER, card) )
      count1 = _.countBy(sorted1, (card) -> card )

      cards2 = _.map( player2.hand, (card) -> card[0] )
      sorted2 = _.sortBy(cards2, (card) -> _.indexOf(ORDER, card) )
      count2 = _.countBy(sorted2, (card) -> card )

      switch player1.rank

        # highest card
        when 1
          if _.indexOf(ORDER, sorted1[4]) > _.indexOf(ORDER, sorted2[4])
            winner = 1
          else
            winner = 2

        # one pair
        when 2
          # console.log sorted1, sorted2
          for card, count of count1 when count is 2
            highest1 = card
          for card, count of count2 when count is 2
            highest2 = card
          # console.log highest1, highest2
          if _.indexOf(ORDER, highest1) > _.indexOf(ORDER, highest2)
            winner = 1
          else if _.indexOf(ORDER, highest1) < _.indexOf(ORDER, highest2)
            winner = 2
          else
            rest1 = _.without(sorted1, highest1)
            rest2 = _.without(sorted2, highest2)
            # console.log rest1, rest2
            if _.indexOf(ORDER, rest1[2]) > _.indexOf(ORDER, rest2[2])
              winner = 1
            else
              winner = 2

        # two pairs
        when 3
          # console.log "CAZ 3"
          # console.log sorted1, sorted2
          # console.log count1, count2
          perechi1 = []
          perechi2 = []
          rest1 = []
          rest2 = []
          for card, count of count1
            perechi1.push card if count is 2
            rest1.push card if count is 1
          for card, count of count2
            perechi2.push card if count is 2
            rest2.push card if count is 1
          perechi1 = _.sortBy( perechi1, (card) -> _.indexOf(ORDER, card) )
          perechi2 = _.sortBy( perechi2, (card) -> _.indexOf(ORDER, card) )
          # console.log perechi1, perechi2
          # console.log rest1, rest2

          [highest1, second1, other1] = [perechi1[1], perechi1[0], rest1[0]]
          [highest2, second2, other2] = [perechi2[1], perechi2[0], rest2[0]]
          # console.log highest1, second1, other1
          # console.log highest2, second2, other2
          if _.indexOf(ORDER, highest1) > _.indexOf(ORDER, highest2)
            winner = 1
          else if _.indexOf(ORDER, highest1) < _.indexOf(ORDER, highest2)
            winner = 2
          else
            if _.indexOf(ORDER, second1) > _.indexOf(ORDER, second2)
              winner = 1
            else if _.indexOf(ORDER, second1) < _.indexOf(ORDER, second2)
              winner = 2
            else
              if _.indexOf(ORDER, other1) > _.indexOf(ORDER, other2)
                winner = 1
              else if _.indexOf(ORDER, other1) < _.indexOf(ORDER, other2)
                winner = 2
              else
                console.log "we are fucked la 2 perechi"
        # end when 3

        # trei cuie si full haus
        when 4, 7
          for card, count of count1 when count is 3
            highest1 = card
          for card, count of count2 when count is 3
            highest2 = card
          # console.log highest1, highest2
          if _.indexOf(ORDER, highest1) > _.indexOf(ORDER, highest2)
            winner = 1
          else if _.indexOf(ORDER, highest1) < _.indexOf(ORDER, highest2)
            winner = 2

        # Straight: All cards are consecutive values
        when 5
          # console.log sorted1, sorted2
          highest1 = sorted1[4]
          highest2 = sorted2[4]
          if _.indexOf(ORDER, highest1) > _.indexOf(ORDER, highest2)
            winner = 1
          else if _.indexOf(ORDER, highest1) < _.indexOf(ORDER, highest2)
            winner = 2
          else
            console.log "we are fucked la straight simplu"

        # culoare
        when 6
          console.log "we are fucked la culoare"

        # careu
        when 8
          for card, count of count1 when count is 4
            highest1 = card
          for card, count of count2 when count is 4
            highest2 = card
          # console.log highest1, highest2
          if _.indexOf(ORDER, highest1) > _.indexOf(ORDER, highest2)
            winner = 1
          else if _.indexOf(ORDER, highest1) < _.indexOf(ORDER, highest2)
            winner = 2

        # when 9, 10

    # end TIE
    # console.log "--------- Winner: Player #{winner}"
    console.log "Game #{zeroPad(index+1)} #{player1.hand} #{player2.hand} => #{winner}"
    if winner is 1
      winsPlayer1++

    # end forEach
    true
  )


console.log "Player 1 has won #{winsPlayer1} games"

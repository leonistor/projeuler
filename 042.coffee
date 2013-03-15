###
Problem 42
Coded triangle numbers

The nth term of the sequence of triangle numbers is given by, 
tn = 1/2 * n(n+1); so the first ten triangle numbers are:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

By converting each letter in a word to a number corresponding to its
alphabetical position and adding these values we form a word value.
For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the
word value is a triangle number then we shall call the word a triangle
word.

Using words.txt (right click and 'Save Link/Target As...'), a 16K text
file containing nearly two-thousand common English words, how many are
triangle words?
###

assert = require 'assert'
_ = require './utils/underscore-min'
words = require('./data/words.js').words

# console.log words[6]
# console.log words.length

# de la pb 22
charValue = (c) ->
  # ASCII value of A is 65
  c.toString().charCodeAt(0) - 65 + 1

test_charValue = ->
  assert.equal 3,  charValue('C') 
  assert.equal 15, charValue('O') 
  assert.equal 12, charValue('L') 
  assert.equal 9,  charValue('I') 
  assert.equal 14, charValue('N') 
  'test charValue passed'
# console.log test_charValue()

nameValue = (name) ->
  value = 0 
  s = name.split('')
  for char in s
    value += charValue(char)
  value

test_nameValue = ->
  assert.equal 53, nameValue('COLIN')
  assert.equal 55, nameValue('SKY')
  'test_nameValue passed'
# console.log test_nameValue()


# x = n*(n+1)/2 => n = (-1 + delta) / 2
# delta = sqrt(1 + 8 * x)
isTriangular = (n) ->
  delta = Math.sqrt(8 * n + 1)
  # http://stackoverflow.com/questions/3885817/how-to-check-if-a-number-is-float-or-integer
  delta % 1 is 0

total = 0
for w in words
  v = nameValue(w)
  if isTriangular(v)
    total++

console.log "#{total} out of #{words.length} are triangle words"
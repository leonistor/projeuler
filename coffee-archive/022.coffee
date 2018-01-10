###
Problem 22
Names scores

Using names.txt (right click and 'Save Link/Target As...'), a 46K text
file containing over five-thousand first names, begin by sorting it
into alphabetical order. Then working out the alphabetical value for
each name, multiply this value by its alphabetical position in the
list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN,
which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the
list. So, COLIN would obtain a score of 938 x 53 = 49714.

What is the total of all the name scores in the file?
###

assert = require 'assert'
_ = require './utils/underscore-min'
names = require('./data/names').names

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
# assert.equal 53, nameValue('COLIN')

names.sort()

total = 0
for name, index in names
  score = (index + 1) * nameValue(name)
  total += score
  if index in [930..940]
    console.log index + 1, name, nameValue(name), score

console.log "Total is: #{total}"

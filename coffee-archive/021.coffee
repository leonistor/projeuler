###
Problem 21
Amicable numbers

Let d(n) be defined as the sum of proper divisors of n (numbers less than n which 
divide evenly into n).
If d(a) = b and d(b) = a, where a != b, then a and b are an amicable pair and each 
of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 
and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 
142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
###

assert = require 'assert'
_ = require './utils/underscore-min'

divisorSum = (n) ->
  return 1 if n is 2
  sum = 1
  for i in [2..Math.ceil(n/2)]
    sum += i if n % i is 0
  sum

testDivisorSum = ->
  assert.equal 8, divisorSum(10) 
  assert.equal 284, divisorSum(220) 
  assert.equal 220, divisorSum(284) 
  'test divisorSum passed'
# console.log testDivisorSum()

divisorArr = []
for i in [2...10000]
  divisorArr.push num:i, divsum: divisorSum(i)

nonPrimes = _.reject divisorArr, (pair) -> pair.divsum is 1

amicablesOne = []
for pair in nonPrimes
  candidates = _.filter nonPrimes, (elem) -> elem.num is pair.divsum
  for what in candidates
    amicablesOne.push from:pair.num, to:pair.divsum if what.divsum is pair.num

amicables = _.reject amicablesOne, (pair) -> pair.from is pair.to

sum = _.reduce amicables, ((memo, pair) -> memo + pair.from), 0

console.log amicables
console.log "The sum is #{sum}"
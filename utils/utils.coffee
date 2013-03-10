# nu uita coffe-c utils.coffee dupa modificari
# 
# usage:
# 
# utils = require "./utils/utils"
# console.log utils.isPrime(13)
# 

exports.isPrime = (n) ->
  i = 2
  while (n != 1) and (i <= Math.sqrt(n))
    if n%i == 0
      return false
    i++
  true

exports.divisorSum = (n) ->
  return 1 if n is 2
  sum = 1
  for i in [2..Math.ceil(n/2)]
    sum += i if n % i is 0
  sum

# testDivisorSum = ->
#   assert.equal 8, divisorSum(10) 
#   assert.equal 284, divisorSum(220) 
#   assert.equal 220, divisorSum(284) 
#   'test divisorSum passed'
# console.log testDivisorSum()

exports.hello = ->
  'hello'
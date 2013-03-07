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

exports.hello = ->
  'hello'
###
Problem 35
Circular primes

The number, 197, is called a circular prime because all rotations of
the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
###


isPrime = require("./utils/utils").isPrime
_ = require './utils/underscore-min'

MIN = 100
# MAX = 1000
MAX = 1000000
count = 13 # circular primes under 100

primes = []
primesFigures = []
for n in [MIN..MAX]
  if isPrime(n)
    primes.push n

# value for array of digits, from pb 32
valueOf = (arr) ->
  ret = 0
  l = arr.length ? 0
  for pos in [0...l]
    ret += Math.pow(10, l-pos-1) * arr[pos]
  ret

# work
for p in primes
  digits = ('' + p).split('').map( (d) -> parseInt(d, 10) )
  isCircular = true
  for i in [0..digits.length-1]
    first = digits.shift()
    digits.push first
    if not _.contains primes, valueOf(digits)
      isCircular = false
      break
  # end for!
  if isCircular
    console.log 'YAY', p
    count++

console.log "Circular primes below one million: #{count}"
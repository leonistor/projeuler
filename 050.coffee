###
Problem 50
Consecutive prime sum

The prime 41, can be written as the sum of six consecutive primes:
41 = 2 + 3 + 5 + 7 + 11 + 13

This is the longest sum of consecutive primes that adds to a prime
below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to
a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most
consecutive primes?
###

isPrime = require("./utils/utils").isPrime
_ = require './utils/underscore-min'

N = 1000000
primes = []
for i in [1..N]
  if isPrime(i)
    primes.push i

target = 1000
sumLength = 21
start = 0
sum = maxSum = 0

x = 0
for p, index in primes
  x += p
  if p > target
    break
console.log "At most #{index} consecutive primes will sum to #{target} "

loop
  sum = 0
  rolling = [start...start+sumLength] 
  for i in rolling
    sum += primes[i]
  if sum > target
    break
  if _.contains(primes, sum)
    if sum > maxSum
      maxSum = sum
  start++

console.log "Found maximum #{maxSum} under #{target} to be the sum of #{sumLength} consecutive primes"





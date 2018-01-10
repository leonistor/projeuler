###
Problem 10
Summation of primes

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.
###

utils = require "./utils/utils"

sum = 17 # 2 + 3 + 5 + 7 are the primes below 10
maxValue = 2000000

for i in [11..maxValue]
  if utils.isPrime(i)
    console.log "Found prime #{i}"
    sum += i

console.log "Sum is #{sum}"

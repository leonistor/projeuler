###
Problem 51
Prime digit replacements

By replacing the 1st digit of *3, it turns out that six of the nine
possible values: 13, 23, 43, 53, 73, and 83, are all prime.

By replacing the 3rd and 4th digits of 56**3 with the same digit, this
5-digit number is the first example having seven primes among the ten
generated numbers, yielding the family: 56003, 56113, 56333, 56443,
56663, 56773, and 56993. Consequently 56003, being the first member of
this family, is the smallest prime with this property.

Find the smallest prime which, by replacing part of the number (not
necessarily adjacent digits) with the same digit, is part of an eight
prime value family. 

###


isPrime = require("./utils/utils").isPrime
_ = require './utils/underscore-min'

N = 100
primes = []
for i in [1..N]
  if isPrime(i)
    primes.push i

# zero padding in base 2
# adapted from http://stackoverflow.com/a/7254108
zeroPad2 = (num, places) ->
  (1e15 + num).toString(2).slice(-places)

k = 5
for i in [1...Math.pow(2,k)]
  console.log i, zeroPad2(i, k)

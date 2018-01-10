###
Problem 70
Totient permutation

Euler's Totient function, phi(n) [sometimes called the phi function], is used to
determine the number of positive numbers less than or equal to n which are
relatively prime to n. For example, as 1, 2, 4, 5, 7, and 8, are all less than
nine and relatively prime to nine, phi(9)=6.
The number 1 is considered to be relatively prime to every positive number, so phi(1)=1.

Interestingly, phi(87109)=79180, and it can be seen that 87109 is a permutation of 79180.

Find the value of n, 1 < n < 10^7, for which phi(n) is a permutation of n 
and the ratio n/phi(n) produces a minimum.
###

big = require('./utils/biginteger').BigInteger
isPrime = require("./utils/utils").isPrime
_ = require './utils/underscore-min'

MAX = Math.pow(10,7)
# MAX = Math.pow(10,3)

primes = []

minR  = MAX
bestN = 1

for n in [2...MAX]
  N = big(n)
  if isPrime(n)
  # primes are not candidates: phi(p) = p-1, cannot be permutation
    primes.push n
  else
    PHI = big(n)
    digitsN = N.toString().split('').sort().join('')
    sizeN = digitsN.length
    # index of max prime divisor
    impd = _.sortedIndex(primes, n/2) 
    # console.log "---", n
    # console.log "dn", digitsN
    sizeOK = true
    i = 0
    while sizeOK and i <= impd
      if n % primes[i] is 0
        # console.log "got divisor #{primes[i]}"
        PHI = PHI.multiply(primes[i] - 1).divide(primes[i])
        sizePHI = PHI.toString().length
        if sizePHI > sizeN
          sizeOK = false
      i++
    # console.log PHI.toString()
    if sizePHI is sizeN
      digitsPHI = PHI.toString().split('').sort().join('')
      # console.log "df", digitsPHI
      if digitsN is digitsPHI
        R = N.valueOf() / PHI.valueOf()
        console.log "got #{n} and #{PHI.toString()} with R #{R}"
        if R < minR
          minR = R
          bestN = n

console.log "Got #{bestN} with ratio #{minR}"

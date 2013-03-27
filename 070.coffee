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


isPrime = require("./utils/utils").isPrime
_ = require './utils/underscore-min'

MAX = Math.pow(10,7)

# descompunerea in factori primi
# returneaza perechile baza base, exponent expo ale descompunerii
primeFactors = (n) ->
  out = []
  if _.contains primes, n
    pair = 
      base: n
      expo:  1
    out.push pair
    return out
  i = 0
  while n isnt 1
    p = 0
    while n % primes[i] is 0
      p++
      n /= primes[i]
    if p 
      pair =
        base: primes[i]
        expo:  p
      out.push pair
    i++
  return out
# end primeFactors

# http://en.wikipedia.org/wiki/Euler%27s_totient_function#Euler.27s_product_formula
# n/phi(n) = produs de p/(p-1) pentru p|n, p prim
maxRatio = 1
maxN = 1

primes = []
factors = []

for n in [1..MAX]
  ratio = 1
  if isPrime(n)
    primes.push n
    ratio = n / (n-1)
  else
    factors[n] = primeFactors(n)
    fact = _.pluck(factors[n], 'base')
    # console.log fact
    for f in fact
      ratio *= f/(f-1)
  if n % 100000 is 0
    console.log n, ratio
  if ratio > maxRatio
    maxRatio = ratio
    maxN     = n

console.log "Got #{maxN} to have max #{maxRatio}"
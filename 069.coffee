###
Problem 69
Totient maximum

Euler's Totient function, phi(n) [sometimes called the phi function], is used to
determine the number of numbers less than n which are relatively prime to n.
For example, as 1, 2, 4, 5, 7, and 8, are all less than nine and relatively
prime to nine, phi(9)=6.


n   Relatively Prime  phi(n)  n/phi(n)
2   1                 1       2
3   1,2               2       1.5
4   1,3               2       2
5   1,2,3,4           4       1.25
6   1,5               2       3
7   1,2,3,4,5,6       6       1.1666...
8   1,3,5,7           4       2
9   1,2,4,5,7,8       6       1.5
10  1,3,7,9           4       2.5

It can be seen that n=6 produces a maximum n/phi(n) for n <= 10.

Find the value of n <= 1,000,000 for which n/phi(n) is a maximum.
###

isPrime = require("./utils/utils").isPrime
_ = require './utils/underscore-min'

MAX = Math.pow(10,6)

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

primes = []
factors = []

for n in [1..100]
  if isPrime(n)
    primes.push n
  else
    factors[n] = primeFactors(n)

# http://en.wikipedia.org/wiki/Euler%27s_totient_function#Euler.27s_product_formula
# n/phi(n) = produs de p/(p-1) pentru p|n, p prim
maxRatio = 1

for n in [1..10]
  ratio = 1
  if _.contains(primes, n)
    ratio = n / (n-1)
  else
    fact = _.pluck(factors[n], 'base')
    # console.log fact
    for f in fact
      ratio *= f/(f-1)
  console.log n, ratio

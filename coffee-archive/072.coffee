###
Problem 72
Counting fractions

Consider the fraction, n/d, where n and d are positive integers. If n<d and
HCF(n,d)=1, it is called a reduced proper fraction.

If we list the set of reduced proper fractions for d <= 8 in ascending order
of size, we get:

1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3,
5/7, 3/4, 4/5, 5/6, 6/7, 7/8

It can be seen that there are 21 elements in this set.

How many elements would be contained in the set of reduced proper fractions
for d <= 1,000,000?
###

# TODO
# de optimizat cu phi(p^k), daca tot faci prime factors
# http://en.wikipedia.org/wiki/Euler's_totient_function#.CF.86.28pk.29_.3D_pk_.E2.88.92_pk_.E2.88.92_1_.3D_pk_.E2.88.92_1.28p_.E2.88.92_1.29

_ = require './utils/underscore-min'
isPrime = require("./utils/utils").isPrime

MAX = 1000000

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
count = 0

for n in [2..MAX]
  if isPrime(n)
    primes.push n
    phi = n-1
  else
    factors = primeFactors(n)
    fact = _.pluck(factors, 'base')
    # console.log fact
    phi = n
    for f in fact
      phi *= (f-1)/f
  # console.log n, phi
  count += phi
  if n % 1000 is 0
    console.log n

console.log count

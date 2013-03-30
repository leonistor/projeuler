###
Ordered fractions
Problem 71

Consider the fraction, n/d, where n and d are positive integers. If n<d and
HCF(n,d)=1, it is called a reduced proper fraction.

If we list the set of reduced proper fractions for d <= 8 in ascending order
of size, we get:

1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 
3/4, 4/5, 5/6, 6/7, 7/8

It can be seen that 2/5 is the fraction immediately to the left of 3/7.

By listing the set of reduced proper fractions for d <= 1,000,000 in ascending
order of size, find the numerator of the fraction immediately to the left of
3/7.
###

isPrime = require("./utils/utils").isPrime
_ = require './utils/underscore-min'

MAX = 1000000
next = 0
[N, D] = [1, 1]

for d in [1..MAX]
  for n in [N...d]
    if 7*n >= 3*d
      break
  n--
  if n / d > next
    next = n / d
    [N, D] = [n, d]
    console.log N, D, next, 3/7

console.log N, D

primes = []

for n in [1..MAX]
  if isPrime(n)
    primes.push n

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
console.log "D:", D
console.log primeFactors(D)
console.log "N:", N
console.log primeFactors(N)

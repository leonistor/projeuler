###
Problem 47
Distinct primes factors

The first two consecutive numbers to have two distinct prime factors are:

14 = 2 x 7
15 = 3 x 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2^2 x 7 x 23
645 = 3 x 5 x 43
646 = 2 x 17 x 19.

Find the first four consecutive integers to have four distinct prime factors. 
What is the first of these numbers?
###

isPrime = require("./utils/utils").isPrime
_ = require './utils/underscore-min'

# pe baza pb 29
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

consec = 3 # first consec consecutive  non-primes
c = 0
i = 1
found = false
while not found 
  if isPrime(i)
    c = 0
    primes.push i
  else 
    factors[i] = primeFactors(i)
    c++
    if c is consec
      # console.log "Found #{consec} consecutive non-primes:"
      for j in [i-c+1..i]
        console.log j
  i++
  if i is 30 then break

console.log factors

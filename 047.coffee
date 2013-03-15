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


MAX = 1000
primes = []
for i in [2..MAX]
  if isPrime(i)
    primes.push i

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

console.log primeFactors(644)
console.log primeFactors(645)
console.log primeFactors(646)

# nu cred ca trebuie MAX
# mergi cu n in sus, daca e prim push in primes daca nu urmatorii doi sau trei 

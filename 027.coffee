###
Problem 27
Quadratic primes

Euler published the remarkable quadratic formula:

n^2 + n + 41

It turns out that the formula will produce 40 primes for the
consecutive values n = 0 to 39. However, when n = 40, 402 + 40 + 41 =
40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41^2 +
41 + 41 is clearly divisible by 41.

Using computers, the incredible formula  n^2 - 79n + 1601 was
discovered, which produces 80 primes for the consecutive values n = 0
to 79. The product of the coefficients, -79 and 1601, is -126479.

Considering quadratics of the form:

    n^2 + an + b, where |a| < 1000 and |b| < 1000

    where |n| is the modulus/absolute value of n
    e.g. |11| = 11 and |-4| = 4

Find the product of the coefficients, a and b, for the quadratic
expression that produces the maximum number of primes for consecutive
values of n, starting with n = 0.
###

isPrime = (n) ->
  if n <= 0 
    return false
  if n is 1
    return true
  i = 2
  while (n != 1) and (i <= Math.sqrt(n))
    if n%i == 0
      return false
    i++
  return true

primesProduced = (a, b) ->
  n = 0
  while isPrime( n*n + a*n + b )
    n++
  return n
# console.log primesProduced(1, 41)
# console.log primesProduced(-79, 1601)

winner = 
  maxPrimes: 0
  a: 0
  b: 0

for b in [-999..999]
  for a in [-999..999]
    p = primesProduced(a, b)
    console.log a, b , p if p > 40
    if p > winner.maxPrimes
      winner.maxPrimes = p
      [winner.a, winner.b] = [a, b]

console.log winner, "Product a*b:" , winner.a * winner.b


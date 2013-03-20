###
Problem 57
Square root convergents

It is possible to show that the square root of two can be expressed as
an infinite continued fraction.

sqrt(2) = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...

By expanding this for the first four iterations, we get:

1 + 1/2 = 3/2 = 1.5
1 + 1/(2 + 1/2) = 7/5 = 1.4
1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...

The next three expansions are 99/70, 239/169, and 577/408, but the
eighth expansion, 1393/985, is the first example where the number of
digits in the numerator exceeds the number of digits in the
denominator.

In the first one-thousand expansions, how many fractions contain a
numerator with more digits than denominator?
###

###

if
n[k]   = a/b
n[k+1] = 1 + 1 / ( 1 + n[k] )
then
n[k+1] = (a + 2b) / (a + b)
where n[1] = 3/2

###

big = require('./utils/biginteger').BigInteger

count = 0
n = 
  a: big(3)
  b: big(2)
step = 1

while step <= 1000
  step++
  saveA = big(0).add(n.a)
  n.a = n.a.add( n.b.multiply(2) )
  n.b = n.b.add(saveA)
  # [n.a, n.b] = [n.a + 2*n.b, n.a + n.b]
  digitsA = n.a.toString().length
  digitsB = n.b.toString().length
  if digitsA > digitsB
    count++
    console.log "Got step #{step}"

console.log "Supra-digit fractions: #{count}"
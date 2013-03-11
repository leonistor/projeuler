###
Problem 26
Reciprocal cycles

A unit fraction contains 1 in the numerator. The decimal
representation of the unit fractions with denominators 2 to 10 are
given:

    1/2 =   0.5
    1/3 =   0.(3)
    1/4 =   0.25
    1/5 =   0.2
    1/6 =   0.1(6)
    1/7 =   0.(142857)
    1/8 =   0.125
    1/9 =   0.(1)
    1/10  =   0.1

Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It
can be seen that 1/7 has a 6-digit recurring cycle.

Find the value of d < 1000 for which 1/d contains the longest
recurring cycle in its decimal fraction part.
###

isPrime = require('./utils/utils').isPrime

###
http://en.wikipedia.org/wiki/Recurring_decimal
Terminating decimals represent rational numbers of the form k/(2^n*5^m)

A fraction in lowest terms with a prime denominator other than 2 or 5
(i.e. coprime to 10) always produces a repeating decimal. The period
of the repeating decimal of 1/p is equal to the order of 10 modulo p.
If 10 is a primitive root modulo p, the period is equal to p - 1; if
not, the period is a factor of p - 1.

1/d has a cycle of n digits if 10n-1 mod d = 0 for prime d.
###

result = cycle = 1

for n in [997..7] by -2
  if isPrime(n)
    console.log "checking #{n}"
    # cautam 10^l mod n = 1
    for l in [1..n]
      if (-1 + Math.pow(10,l)) % n is 0
        # l este length cycle of 1/n
        break
    console.log "1/#{n} has cycle length: #{l}"
    if l > cycle
      result = n
      cycle  = l
console.log "Finally: #{result} has cycle #{cycle}"

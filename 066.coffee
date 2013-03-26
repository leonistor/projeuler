###
Problem 66
Diophantine equation

Consider quadratic Diophantine equations of the form:

x^2 - Dy^2 = 1

For example, when D=13, the minimal solution in x is 649^2 - 13x180^2 = 1.

It can be assumed that there are no solutions in positive integers when D is
square.

By finding minimal solutions in x for D = {2, 3, 5, 6, 7}, we obtain the
following:

  3^2 - 2x2^2 = 1
  2^2 - 3x1^2 = 1
* 9^2 - 5x4^2 = 1
  5^2 - 6x2^2 = 1
  8^2 - 7x3^2 = 1

Hence, by considering minimal solutions in x for D <= 7, the largest x is
obtained when D=5.

Find the value of D <= 1000 in minimal solutions of x for which the largest
value of x is obtained.
###

big = require('./utils/biginteger').BigInteger

bestX = bestD = big(1)

for D in [2..100] when ( Math.sqrt(D) isnt Math.floor(Math.sqrt(D)) )
  x = big(1)
  found = false
  while not found
    # x++
    x = x.next()
    y = big(x).prev()
    # for y in [x-1..1]
    while not y.isUnit()
      if big(x).multiply(x).subtract( big(D).multiply(y).multiply(y) ).isUnit()
      # if (x*x - D*y*y - 1) is 0
        found = true
        console.log "D=#{D.toString()}: #{x.toString()}^2 - #{D.toString()} x #{y.toString()}^2 = 1"
        if x.compare(bestX) is 1
          # [bestX, bestD] = [x, D]
          bestX = big(x)
          bestD = big(D)
      y = y.prev()

console.log "Got #{bestD} for largest #{bestX}"
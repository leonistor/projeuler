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

bestX = bestD = 1

for D in [2..1000] when ( Math.sqrt(D) isnt Math.floor(Math.sqrt(D)) )
  x = 1
  found = false
  while not found
    x++
    for y in [1..x]
      if (x*x - D*y*y) is 1
        found = true
        console.log "D=#{D}: #{x}^2 - #{D} x #{y}^2 = 1"
        if x > bestX
          [bestX, bestD] = [x, D]

console.log "Got #{bestD} for largest #{bestX}"
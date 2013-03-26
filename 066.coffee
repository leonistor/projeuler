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
_ = require './utils/underscore-min'

# http://en.wikipedia.org/wiki/Pell%27s_equation#Example
# http://en.wikipedia.org/wiki/Continued_fraction#Generalized_continued_fraction_for_square_roots

MAX = 1000
squares = []
i = 1
while i*i <= MAX
  squares.push i*i
  i++

CF = [] # array of objects with continued fractions

for n in [2..MAX]
  # console.log "---- ", n
  c = {}
  if not _.contains(squares, n)
    cfe = '' # continued fraction expansion
    m = 0
    d = 1
    a0 = a = Math.floor(Math.sqrt(n))
    c.a0 = a0
    c.a = []
    cfe += '[' + a0 + ';('
    prima = true
    i = 0
    # for i in [1..10]
    loop
      m = d * a - m
      d = (n - m * m) / d
      a = Math.floor( (a0 + m) / d )
      if not prima and (starta is a and startd is d and startm is m)
        break
      cfe += '' + a + ','
      c.a.push a
      if prima
        [startm, startd, starta] = [m, d, a]
        prima = false
      i++
    cfe += ')]'
    # console.log cfe, " period", i
    c.period = i
    CF[n] = c

# cfe = CF[7]
# console.log cfe

getA = (index) ->
  if index is 0 
    return cfe.a0
  else
    return cfe.a[ (index - 1) % cfe.period ]
# for i in [0..20]
#   console.log i, getA(i)

###
k = 1
# console.log "#{k}:"

sus = big(1)
jos = big( getA(k) )
while k > 0
  tmp = big(sus)
  sus = big(jos)
  jos = big(tmp).add( jos.multiply( getA(k-1) ) )
  # console.log "k: #{sus.toString()} / #{jos.toString()}"
  k--
x = big(jos) # shit, e pe dos
y = big(sus)
# console.log "#{x.toString()} / #{y.toString()}"
###

bestX = bestD = big(1)

for D in [2..1000]
  if not _.contains(squares, D)
    cfe = CF[D]
    found = false
    start = 1
    while not found
      k = start
      sus = big(1)
      jos = big( getA(k) )
      while k > 0
        tmp = big(sus)
        sus = big(jos)
        jos = big(tmp).add( jos.multiply( getA(k-1) ) )
        # console.log "k: #{sus.toString()} / #{jos.toString()}"
        k--
      x = big(jos) # shit, e pe dos
      y = big(sus)
      # check Pell
      # if big(x).multiply(x).subtract( big(D).multiply(y).multiply(y) ).isUnit() --> fucking shit, da true pentru 1 si -1
      if big(x).multiply(x).subtract( big(D).multiply(y).multiply(y) ).valueOf() is 1
        found = true
        console.log "D=#{D.toString()}: #{x.toString()}^2 - #{D.toString()} x #{y.toString()}^2 = 1"
        if x.compare(bestX) is 1
          bestX = big(x)
          bestD = big(D)
          # console.log "#{x.toString()}, #{D.toString()}"
      start++

console.log "Got #{bestD} for largest minimal x: #{bestX.toString()}"
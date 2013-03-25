###
Problem 64
Odd period square roots

All square roots are periodic when written as continued fractions

It can be seen that the sequence is repeating. For conciseness, we use
the notation sqrt23 = [4;(1,3,1,8)], to indicate that the block (1,3,1,8)
repeats indefinitely.

The first ten continued fraction representations of (irrational)
square roots are:

sqrt2=[1;(2)], period=1
sqrt3=[1;(1,2)], period=2
sqrt5=[2;(4)], period=1
sqrt6=[2;(2,4)], period=2
sqrt7=[2;(1,1,1,4)], period=4
sqrt8=[2;(1,4)], period=2
sqrt10=[3;(6)], period=1
sqrt11=[3;(3,6)], period=2
sqrt12= [3;(2,6)], period=2
sqrt13=[3;(1,1,1,1,6)], period=5

Exactly four continued fractions, for N <= 13, have an odd period.

How many continued fractions for N <= 10000 have an odd period?
###

_ = require './utils/underscore-min'

# de folosit http://www.maths.surrey.ac.uk/hosted-sites/R.Knott/Fibonacci/cfINTRO.html#sqrtcf

MAX = 10000
squares = []
i = 1
while i*i <= MAX
  squares.push i*i
  i++

# console.log squares[-10..]
# console.log squares.length

###
for n in [2..25]
  # console.log n
  if not _.contains(squares, n)
    mmm = _.sortedIndex(squares, n) - 1
    mm = squares[mmm]
    m = Math.sqrt(mm)
    console.log "---- n = #{n}, m = #{m}"
    console.log "c = #{n-m*m}"

###

count = 0

for n in [2..MAX]
  console.log "---- ", n
  if not _.contains(squares, n)
    cfe = '' # continued fraction expansion
    m = 0
    d = 1
    a0 = a = Math.floor(Math.sqrt(n))
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
      if prima
        [startm, startd, starta] = [m, d, a]
        prima = false
      i++
    cfe += ')]'
    console.log cfe, " period", i
    if i % 2 is 1
      count++

console.log "Avem #{count}"
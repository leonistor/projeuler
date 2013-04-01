###
Problem 75
Singular integer right triangles

It turns out that 12 cm is the smallest length of wire that can be bent to
form an integer sided right angle triangle in exactly one way, but there are
many more examples.

12 cm: (3,4,5)
24 cm: (6,8,10)
30 cm: (5,12,13)
36 cm: (9,12,15)
40 cm: (8,15,17)
48 cm: (12,16,20)

In contrast, some lengths of wire, like 20 cm, cannot be bent to form an
integer sided right angle triangle, and other lengths allow more than one
solution to be found; for example, using 120 cm it is possible to form exactly
three different integer sided right angle triangles.

120 cm: (30,40,50), (20,48,52), (24,45,51)

Given that L is the length of the wire, for how many values of L <= 1,500,000
can exactly one integer sided right angle triangle be formed?
###

_ = require './utils/underscore-min'

# Euclid for greatest common divisor
gcd = (a, b) ->
  while b isnt 0
    t = b
    b = a % t
    a = t
  a
# console.log gcd(1071, 462)

# maxL = 200
maxL = 1500000
stop = Math.floor(Math.sqrt(maxL))+5000

# cautam primitive Pythagorean triples
triples = []
# insemnam ce lungimi se produc cu triplet si k*triplet
lungimi  = []
for x in [0..maxL]
  triples[x] = 0
  lungimi[x] = 0

for m in [1..stop]
  for n in [1...m]
    a = m * m - n * n
    b = 2 * m * n
    c = m * m + n * n
    l = a + b + c
    # http://www.math.rutgers.edu/~erowland/pythagoreantriples.html
    # Theorem 2
    s = m - n
    r = n
    if (l <= maxL) and (s % 2 is 1) and (gcd(r, s) is 1)
      # console.log "got ", a, b, c, l
      lungimi[l] = 1
      triples[l] = 1

for t, l in triples
  if t isnt 0
    k = 2
    while k * l <= maxL
      lungimi[k * l] += 1
      k++

count = 0
for c, l in lungimi
  if c is 1
    count++

console.log count

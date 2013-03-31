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

# maxL = 1200
maxL = 1500000
stop = Math.floor(Math.sqrt(maxL))+1000

# cautam primitive Pythagorean triples

triplets = []
lungimi  = []

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
    # console.log m, n, '->', a, b, c, l, (s % 2 is 1), (gcd(r, s) is 1)
    if (l <= maxL) and (s % 2 is 1) and (gcd(r, s) is 1)
      # console.log "got ", a, b, c, l
      tri =
        len:   l
        clean: 1
      lungimi.push tri
      if a < b 
        triplets.push [a, b, c, l]
      else
        triplets.push [b, a, c, l]

# console.log triplets.length
# console.log lungimi
lungimi.sort((x, y) -> x.len-y.len) 
# console.log lungimi

# in loc de _.sortedIndex
jumate = 0
for l, index in lungimi
  if l.len > maxL/2
    jumate = index - 1
    break

# console.log lungimi[jumate]
for caut in [0..jumate]
  sursa = lungimi[caut]
  murdar = false
  for alta in lungimi[caut+1..]
    if alta.clean is 1 and alta.len % sursa.len is 0
      murdar = true
      alta.clean = 0
  if murdar
    sursa.clean = 0

count = 0
console.log lungimi.length
for l in lungimi
  if l.clean is 1
    count++
console.log "#{count} are clean"
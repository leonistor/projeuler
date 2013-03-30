###
Problem 72
Counting fractions

Consider the fraction, n/d, where n and d are positive integers. If n<d and
HCF(n,d)=1, it is called a reduced proper fraction.

If we list the set of reduced proper fractions for d <= 8 in ascending order
of size, we get:

1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3,
5/7, 3/4, 4/5, 5/6, 6/7, 7/8

It can be seen that there are 21 elements in this set.

How many elements would be contained in the set of reduced proper fractions
for d <= 1,000,000?
###

_ = require './utils/underscore-min'

# http://en.wikipedia.org/wiki/Continued_fraction#Calculating_continued_fraction_representations
# cf for n/d, n < d; first step is 0, we'll skip it
continuedFraction = (n, d) ->
  ret = ''
  while reminder = d % n
    # console.log d, n, '%', reminder
    # console.log reminder
    f = Math.floor(d/n)
    ret += '' + f + ','
    d = n
    n = reminder
    # console.log "next", d, n
  ret += '' + d/n
  ret
# end continuedFraction

# console.log continuedFraction(49,200)
# console.log continuedFraction(2*49,2*200)
# console.log continuedFraction(7455,9218)
# console.log continuedFraction(2*7455,2*9218)

MAX = 1000000

cf = []
for d in [1..MAX]
  for n in [1...d]
    # console.log "#{n}/#{d}, #{continuedFraction(n,d)}"
    cf.push continuedFraction(n,d)
  if d % 1000 is 0
    console.log d

console.log "Got #{cf.length} continued fractions"

ucf = _.uniq(cf)

console.log "Got #{ucf.length} unique continued fractions"

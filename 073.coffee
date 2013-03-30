###
Problem 73
Counting fractions in a range

Consider the fraction, n/d, where n and d are positive integers. If n<d and
HCF(n,d)=1, it is called a reduced proper fraction.

If we list the set of reduced proper fractions for d <= 8 in ascending order
of size, we get:

1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3,
5/7, 3/4, 4/5, 5/6, 6/7, 7/8

It can be seen that there are 3 fractions between 1/3 and 1/2.

How many fractions lie between 1/3 and 1/2 in the sorted set of reduced proper
fractions for d <= 12,000?
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

MAX = 12000
fractions = []

for d in [1..MAX]
  for n in [1...d]
    [N, D] = [n, d]
    if 3 * n > d and 2 * n < d
      if (r = gcd(d, n)) isnt 1
        [N, D] = [N/r, D/r]
      # console.log "#{n}/#{d} = #{N}/#{D}"
      fractions.push '' + N + '/' + D
  if n % 1000 is 0
    console.log n

console.log fractions.length
console.log "sorting"
fractions.sort()

uf = _.uniq(fractions, true)

console.log "Got #{fractions.length} fractions, of which #{uf.length} are unique"

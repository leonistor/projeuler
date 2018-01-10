###
Problem 62
Cubic permutations

The cube, 41063625 (345^3), can be permuted to produce two other cubes:
56623104 (384^3) and 66430125 (405^3). In fact, 41063625 is the smallest cube
which has exactly three permutations of its digits which are also cube.

Find the smallest cube for which exactly five permutations of its digits are
cube.
###

big = require('./utils/biginteger').BigInteger
_ = require './utils/underscore-min'

cubes = []
for n in [1..10000]
  N = big(n)
  C = N.pow(3)
  c = 
    n:      n
    cube:   C.toString()
    digits: C.toString().split('').sort().join('')
  # console.log N.toString(), C.toString(), C.toString().split('').sort().join('')
  cubes.push c
# console.log cubes

grupe = _.groupBy(cubes, 'digits')
# console.log grupe

for key, arr of grupe when arr.length > 4
  console.log arr
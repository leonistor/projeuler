###
Problem 80
Square root digital expansion

It is well known that if the square root of a natural number is not an
integer, then it is irrational. The decimal expansion of such square roots is
infinite without any repeating pattern at all.

The square root of two is 1.41421356237309504880..., and the digital sum of
the first one hundred decimal digits is 475.

For the first one hundred natural numbers, find the total of the digital sums
of the first one hundred decimal digits for all the irrational square roots.
###

Big = require('./utils/big')
Big.DP = 110

total = 0
for n in [2..100]
  console.log n
  str = Big(n).sqrt().toString()
  console.log str
  if str.indexOf('.') isnt -1
    dec = str.substr( str.indexOf('.') + 1, 99 ).split('')
    sum = Math.floor(Math.sqrt(n))
    for c in dec
      sum += parseInt(c, 10)
    console.log sum
    total += sum
  console.log '---'

console.log '===='
console.log total



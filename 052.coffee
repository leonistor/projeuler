###
Problem 52
Permuted multiples

It can be seen that the number, 125874, and its double, 251748,
contain exactly the same digits, but in a different order.

Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and
6x, contain the same digits.
###

_ = require './utils/underscore-min'

digits = (n) ->
  n.toString().split('').sort().join('')

# console.log digits(125874)
# console.log digits(251748)

i = 1
loop
  i++
  if digits(2*i) is digits(3*i) is digits(4*i) is digits(5*i) is digits(6*i)
    console.log i, 2*i, 3*i, 4*i, 5*i, 6*i
    break
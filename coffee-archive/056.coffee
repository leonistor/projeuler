###
Problem 56
Powerful digit sum

A googol (10^100) is a massive number: one followed by one-hundred
zeros; 100^100 is almost unimaginably large: one followed by two-
hundred zeros. Despite their size, the sum of the digits in each
number is only 1.

Considering natural numbers of the form, a^b, where a, b < 100, what is
the maximum digital sum?
###

big = require('./utils/biginteger').BigInteger

maxDigitSum = 0

for a in [2...100]
  A = big(a)
  for b in [2...100]
    AB = A.pow(b)
    sum = 0
    s = AB.toString().split('')
    for d in s
      sum += parseInt(d, 10)
    if sum > maxDigitSum
      maxDigitSum = sum

console.log "Maximum digital sum is #{maxDigitSum}"
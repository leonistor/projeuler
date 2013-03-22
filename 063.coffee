###
Problem 63
Powerful digit counts

The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit
number, 134217728=8^9, is a ninth power.

How many n-digit positive integers exist which are also an nth power?
###

big = require('./utils/biginteger').BigInteger
_ = require './utils/underscore-min'

count = 0
for base in [1..100]
  B = big(base)
  for n in [1..50]
    P = B.pow(n)
    if P.toString().length is n
      count++
      console.log "#{base}^#{n} = #{P.toString()} e bun"

console.log "Got #{count}"
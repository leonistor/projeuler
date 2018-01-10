###
Problem 23
Non-abundant sums

A perfect number is a number for which the sum of its proper divisors
is exactly equal to the number. For example, the sum of the proper
divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28
is a perfect number.

A number n is called deficient if the sum of its proper divisors is
less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the
smallest number that can be written as the sum of two abundant numbers
is 24. By mathematical analysis, it can be shown that all integers
greater than 28123 can be written as the sum of two abundant numbers.
However, this upper limit cannot be reduced any further by analysis
even though it is known that the greatest number that cannot be
expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as
the sum of two abundant numbers.
###

divisorSum = require('./utils/utils').divisorSum
_ = require './utils/underscore-min'

MAXVALUE = 28123
MINVALUE = 24

divisorArr = []
for i in [2..MAXVALUE]
  divisorArr.push num:i, divsum: divisorSum(i)

abundantsDiv = _.filter divisorArr, (pair) -> pair.divsum > pair.num

l = abundantsDiv.length
console.log abundantsDiv[0...20]
# console.log abundantsDiv[l-20...l]
console.log "We have", l, "abundant numbers under", MAXVALUE

abundants = []
for pair in abundantsDiv
  abundants.push pair.num

console.log abundants[0..20]

sum = 0
# sum the integers under 24: the smallest number that can be written as 
# the sum of two abundant numbers is 24
for i in [1..23]
  sum += i

for num in [MINVALUE..MAXVALUE]
  i = 0
  expressed = false
  while ( rest = num - abundants[i] ) >= 12
    if _.contains abundants, rest
      # console.log "#{num}=#{abundants[i]}+#{rest}"
      expressed = true
      break
    i++
  if not expressed 
    sum += num
    console.log num

console.log "The sum is #{sum}"

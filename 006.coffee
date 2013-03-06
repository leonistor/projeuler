###
Problem 6
Sum square difference

The sum of the squares of the first ten natural numbers is,
1^2 + 2^2 + ... + 10^2 = 385

The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)^2 = 55^2 = 3025

Hence the difference between the sum of the squares of the first ten natural numbers 
and the square of the sum is 3025 - 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural
 numbers and the square of the sum.
###

s = ss = 0

for i in [1..100]
  ss += i*i
  s += i

console.log "Sum of squares #{ss} minus square of sum #{s*s} is ", ss-s*s
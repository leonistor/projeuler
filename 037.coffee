###
Problem 37
Truncatable primes

The number 3797 has an interesting property. Being prime itself, it is
possible to continuously remove digits from left to right, and remain
prime at each stage: 3797, 797, 97, and 7. Similarly we can work from
right to left: 3797, 379, 37, and 3.

Find the sum of the only eleven primes that are both truncatable from
left to right and right to left.

NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
###

# atentie, 1 nu este prim, vezi http://primes.utm.edu/notes/faq/one.html
isPrime = require("./utils/utils").isPrime
_ = require './utils/underscore-min'

# value for array of digits, from pb 32
valueOf = (arr) ->
  ret = 0
  l = arr.length ? 0
  for pos in [0...l]
    ret += Math.pow(10, l-pos-1) * arr[pos]
  ret

MAXCOUNT = 11
count = sum = 0

n = 11
loop
  if isPrime n
    digits = ('' + n).split('').map( (d) -> parseInt(d, 10) )
    isTruncatable = true
    l = digits.length-1
    for i in [1..l]
      left  = digits[i..l]
      right = digits[0..l-i]
      if not ( isPrime( valueOf(left) ) and isPrime( valueOf(right) ) )
        isTruncatable = false
        break
    # end for!
    if isTruncatable
      count++
      sum += n
      console.log count, n
  # end if isPrime
  n++
  if count is MAXCOUNT
    break

console.log "The sum is #{sum}"
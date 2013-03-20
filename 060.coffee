###
Problem 60
Prime pair sets

The primes 3, 7, 109, and 673, are quite remarkable. By taking any two
primes and concatenating them in any order the result will always be
prime. For example, taking 7 and 109, both 7109 and 1097 are prime.
The sum of these four primes, 792, represents the lowest sum for a set
of four primes with this property.

Find the lowest sum for a set of five primes for which any two primes
concatenate to produce another prime.
###

isPrime = require("./utils/utils").isPrime
_ = require './utils/underscore-min'

# value for array of digits
valueOf = (arr) ->
  ret = 0
  l = arr.length ? 0
  for pos in [0...l]
    ret += Math.pow(10, l-pos-1) * arr[pos]
  ret

numConcat = (a, b) ->
  parseInt(a.toString().concat(b.toString()), 10)

# check if set of primes (arr) meets condition:
#  By taking any two primes and concatenating them in any order 
# the result will always be prime
superSet = (arr) ->
  for a in arr
    for b in arr when b isnt a
      # console.log [a,b]
      if (not isPrime(numConcat(a,b))) or (not isPrime(numConcat(b,a)))
        return false
  return true
# console.log superSet( [1, 13, 7, 21] )
# console.log superSet( [3, 7, 109, 673] )

setSum = (arr) ->
  sum = 0
  for e in arr
    sum += e
  sum
# console.log setSum([1, 13, 7, 21])
# console.log setSum([3, 7, 109, 673])


# prepare primes list
maxPrimeSize = 2 # hm!
N = Math.pow(10,maxPrimeSize) - 1
primes = []
for i in [2..N]
  if isPrime(i)
    primes.push i

# primes = [3, 7, 13, 17, 109, 41, 673]
total = primes.length

minSum = 5 * primes[total-1]
# console.log minSum

cand = []
###
for a in primes
  for b in primes when b isnt a
    for c in primes when c isnt b and c isnt a
      for d in primes when d isnt c and d isnt b and d isnt a
          sum = 0
          if superSet([a, b, c, d])
            cand.push [a, b, c, d]
            sum = setSum([a, b, c, d])
            console.log(sum, [a, b, c, d])
            if sum < minSum
              minSum = sum

console.log cand
console.log "The sum is #{minSum}"
###

fours = [
  [ 3, 7, 109, 673 ],
  [ 23, 311, 677, 827 ]
]

sss = (arr, x) ->
  for n in arr
    # console.log [a,b]
    if (not isPrime(numConcat(n,x))) or (not isPrime(numConcat(x,n)))
      return false
  return true

i = 2
loop
  if isPrime(i)
    if sss([3, 7, 109, 673], i)
      sum = setSum([3, 7, 109, 673, i])
      console.log(sum, [3, 7, 109, 673, i])
    if sss([23, 311, 677, 827], i)
      sum = setSum([23, 311, 677, 827, i])
      console.log(sum, [23, 311, 677, 827, i])
  i++

###
console.log total
minSum = 5 * primes[total-1]

console.log "Checking 3, 7, 109, 673"
for x in _.without(primes, 3, 7, 109, 673)
  if superSet([3, 7, 109, 673, x])
    sum = setSum([3, 7, 109, 673, x])
    console.log(sum, [3, 7, 109, 673, x])

console.log "Checking 23, 311, 677, 827"
for x in _.without(primes, 23, 311, 677, 827)
  if superSet([23, 311, 677, 827, x])
    sum = setSum([23, 311, 677, 827, x])
    console.log(sum, [23, 311, 677, 827, x])



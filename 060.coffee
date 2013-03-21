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
maxPrimeSize = 4
N = Math.pow(10, maxPrimeSize) - 1
primes = []
for i in [2..N]
  if isPrime(i)
    primes.push i
total = primes.length

minSum = 5 * primes[total-1]
# console.log minSum


# rezolvat de 
# http://blog.dreamshire.com/2009/06/03/project-euler-problem-60-solution/
# nu m-a dus capu'

perechi = []

for p in primes
  perechi[p] = []
  for q in primes when q > p
    if isPrime(numConcat(p,q)) and isPrime(numConcat(q,p))
      perechi[p].push q

# console.log perechi

# for set, p in perechi when set? and set.length > 0
  # console.log p, set 

###
for set_first, first in perechi when set_first? and set_first.length > 0
  for second in set_first
    set_second = _.intersection(set_first, perechi[second])
    if set_second.length > 0
      # console.log first, second, set_second
      for third in set_second
        set_third = _.intersection(set_second, perechi[third])
        if set_third.length > 0
          # console.log first, second, third, set_third
          for fourth in set_third
            set_fourth = _.intersection(set_third, perechi[fourth])
            if set_fourth.length > 0
              console.log first, second, third, fourth, set_fourth
###

console.log superSet([13, 5197, 5701, 6733, 8389])
console.log setSum([13, 5197, 5701, 6733, 8389])

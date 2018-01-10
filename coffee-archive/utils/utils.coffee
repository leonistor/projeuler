# nu uita coffe-c utils.coffee dupa modificari
# 
# usage:
# 
# utils = require "./utils/utils"
# console.log utils.isPrime(13)
# 

exports.isPrime = (n) ->
  if n < 2
    return false
  i = 2
  while (n != 1) and (i <= Math.sqrt(n))
    if n%i == 0
      return false
    i++
  true

exports.divisorSum = (n) ->
  return 1 if n is 2
  sum = 1
  for i in [2..Math.ceil(n/2)]
    sum += i if n % i is 0
  sum

# testDivisorSum = ->
#   assert.equal 8, divisorSum(10) 
#   assert.equal 284, divisorSum(220) 
#   assert.equal 220, divisorSum(284) 
#   'test divisorSum passed'
# console.log testDivisorSum()

exports.hello = ->
  'hello'

# folosind http://www.quickperm.org/
# The Countdown QuickPerm Algorithm:

#    let a[] represent an arbitrary list of objects to permute
#    let N equal the length of a[]
#    create an integer array p[] of size N+1 to control the iteration     
#    initialize p[0] to 0, p[1] to 1, p[2] to 2, ..., p[N] to N
#    initialize index variable i to 1
#    while (i < N) do {
#       decrement p[i] by 1
#       if i is odd, then let j = p[i] otherwise let j = 0
#       swap(a[j], a[i])
#       let i = 1
#       while (p[i] is equal to 0) do {
#          let p[i] = i
#          increment i by 1
#       } // end while (p[i] is equal to 0)
#    } // end while (i < N)

###
a = [1, 2, 3, 4, 5, 6]
N = a.length

# permutation count
count = 1
console.log count, a

p = []
for n in [0..N]
  p[n] = n
i = 1
while i < N
  p[i]--
  if i % 2 is 1
    j = p[i]
  else
    j = 0
  [ a[j], a[i] ] = [ a[i], a[j] ]
  i = 1
  while p[i] is 0
    p[i] = i
    i++
  count++
  console.log count, a

console.log count
###
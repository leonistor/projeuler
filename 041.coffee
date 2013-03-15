###
Problem 41
Pandigital prime

We shall say that an n-digit number is pandigital if it makes use of 
all the digits 1 to n exactly once. For example, 2143 is a 4-digit 
pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?
###

isPrime = require("./utils/utils").isPrime
_ = require './utils/underscore-min'

# generam permutari ca la pb 32

# all permutations
all = []

a = [1, 2, 3, 4, 5, 6, 7]
# a = [1, 2, 3, 4]
N = a.length

# permutation count
count = 1
# console.log count, a
all.push a.slice()

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
  # console.log count, a
  # all.push JSON.stringify(a)
  all.push a.slice()

# console.log all
# console.log count
console.log "#{all.length} permutations generated"

# avem permutarile, pornim!

# value for array of digits
valueOf = (arr) ->
  ret = 0
  l = arr.length ? 0
  for pos in [0...l]
    ret += Math.pow(10, l-pos-1) * arr[pos]
  ret

maxNum = 0
for perm in all
  num = valueOf(perm)
  # console.log num, perm
  if isPrime(num)
    console.log num
    if num > maxNum
      maxNum = num

console.log "Maximum pandigital prime for #{a.length} digits is #{maxNum}"
# 7652413 for 7 digits






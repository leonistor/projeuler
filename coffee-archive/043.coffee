###
Problem 43
Sub-string divisibility

The number, 1406357289, is a 0 to 9 pandigital number because it is
made up of each of the digits 0 to 9 in some order, but it also has a
rather interesting sub-string divisibility property.

Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way,
we note the following:

    d2d3d4=406 is divisible by 2
    d3d4d5=063 is divisible by 3
    d4d5d6=635 is divisible by 5
    d5d6d7=357 is divisible by 7
    d6d7d8=572 is divisible by 11
    d7d8d9=728 is divisible by 13
    d8d9d10=289 is divisible by 17

Find the sum of all 0 to 9 pandigital numbers with this property.
###

# nr = [1,4,0,6,3,5,7,2,8,9]

setValue = (num, pos) ->
  if not ( 2 <= pos <= 8 )
    return 0
  num[pos-1]*10*10 + num[pos]*10 + num[pos+1]
# console.log setValue(nr, 8)

primes = [2, 3, 5, 7, 11, 13, 17]
# test for those 7 funny properties
funny = (num) ->
  isFunny = true
  for i in [2..8]
    if setValue(num, i) % primes[i-2] isnt 0
      isFunny = false
  isFunny
# console.log funny(nr)

# value for array of digits
valueOf = (arr) ->
  ret = 0
  l = arr.length ? 0
  for pos in [0...l]
    ret += Math.pow(10, l-pos-1) * arr[pos]
  ret

a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
# a = [0, 1, 2]
N = a.length
sum = 0

# quickperm
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
  # work here
  if funny(a)
    console.log a, valueOf(a)
    sum += valueOf(a)

console.log "The sum is #{sum}"


###
Problem 51
Prime digit replacements

By replacing the 1st digit of *3, it turns out that six of the nine
possible values: 13, 23, 43, 53, 73, and 83, are all prime.

By replacing the 3rd and 4th digits of 56**3 with the same digit, this
5-digit number is the first example having seven primes among the ten
generated numbers, yielding the family: 56003, 56113, 56333, 56443,
56663, 56773, and 56993. Consequently 56003, being the first member of
this family, is the smallest prime with this property.

Find the smallest prime which, by replacing part of the number (not
necessarily adjacent digits) with the same digit, is part of an eight
prime value family. 
###

isPrime = require("./utils/utils").isPrime
_ = require './utils/underscore-min'

# zero padding in base 2
# adapted from http://stackoverflow.com/a/7254108
zeroPad2 = (num, places) ->
  (1e15 + num).toString(2).slice(-places)

# count the bits in the binary representation
# from http://stackoverflow.com/a/8871435
# vezi si Hack Memo (facut cand eu nici nu aveam 1 an: Feb 1972!!!)
bitCount = (n) ->
  count = 0
  while n > 0
    count++
    n = n & (n-1)
  count

# prepare primes list
maxPrimeSize = 6 # hm!
N = Math.pow(10,maxPrimeSize) - 1
primes = []
for i in [11..N] # ignore 1-digit primes
  if isPrime(i)
    primes.push i

# prepare mask for digit replacement
mask = []
for k in [2..maxPrimeSize]
  # console.log(k, '-----------')
  m = []
  for i in [1..Math.pow(2,k)-2]
    # console.log i, zeroPad2(i, k), bitCount(i)
    m.push 
      val:  i
      mask: zeroPad2(i, k)
  # console.log m
  m = _.sortBy( m, (pair) -> bitCount(pair.val) )
  # console.log m
  m = _.pluck( m, 'mask' )
  # console.log m
  mask[k] = m.slice()

# for m, bits in mask
#   if m?
#     console.log bits, m
# console.log mask[3]

# console.log primes
# console.log mask

# value for array of digits
valueOf = (arr) ->
  ret = 0
  l = arr.length ? 0
  for pos in [0...l]
    ret += Math.pow(10, l-pos-1) * arr[pos]
  ret

# to keep the last family
family = []
# count how many primes we get from num by using mask to replace digits
familyCount = (num, mask) ->
  # nu e clar daca trebuie si 0, in primul exemplu daca luam 
  # si 0 obtinem si pe 3, tot prim!
  digits = [1,2,3,4,5,6,7,8,9] 
  
  count = 1
  family = []
  family.push num
  
  n = num.toString().split('').map( (d) -> parseInt(d, 10) )

  for d in digits
    gen = []
    for orig, pos in n
      if mask[pos] is '1'
        gen[pos] = d
      else
        gen[pos] = orig
    g = valueOf(gen)
    if isPrime(g)
    # sau _.contains(primes, g) ???
      family.push g
      count++

  count
# end familyCount

# console.log familyCount(13, '10')
# console.log family
# console.log familyCount(56003, '00110')
# console.log family

targetFamilyCount = 9
found = 0
for p in primes
  maskSize = p.toString().length
  # console.log p, mask[maskSize]
  for m in mask[maskSize]
    if familyCount(p,m) is targetFamilyCount
      console.log "Found #{p} with mask #{m}"
      console.log family      
      found++
  if found > 10
    break

# _.indexOf(array, value, [isSorted])
# console.log _.indexOf(primes, 56003, true) => 5679
# console.log _.indexOf(primes, 121313, true)

# abordare gresita de rafucat
# gasesti rezultatul cu mask target 9

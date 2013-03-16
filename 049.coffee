###
Problem 49
Prime permutations

The arithmetic sequence, 1487, 4817, 8147, in which each of the terms
increases by 3330, is unusual in two ways: (i) each of the three terms
are prime, and, (ii) each of the 4-digit numbers are permutations of
one another. 

There are no arithmetic sequences made up of three 1-,
2-, or 3-digit primes, exhibiting this property, but there is one
other 4-digit increasing sequence. 

What 12-digit number do you form by concatenating the three terms in 
this sequence? 
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

cand = [] # candidates: 4-digit primes permutations of other

# for n in [1486..1499]
for n in [1000..9999]
  if isPrime(n)
    perms = [] # permutations of n
    a = n.toString().split('').map( (d) -> parseInt(d, 10) )
    perms.push a.slice()
    # quickperms of a
    N = a.length
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
      # got permutation
      if isPrime(valueOf(a))
        perms.push a.slice()
    # end quickperms
    if perms.length > 2
      # TODO: quickperm duplicates values
      # _.uniq(array, [isSorted], [iterator])
      cand.push _.uniq( perms.slice().sort(), false, (e) -> JSON.stringify(e) )

console.log "Found #{cand.length} candidates"

for c in cand[100..110]
  console.log c




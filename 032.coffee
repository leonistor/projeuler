###
Problem 32
Pandigital products

We shall say that an n-digit number is pandigital if it makes use of all the
digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1
through 5 pandigital.

The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing
multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity
can be written as a 1 through 9 pandigital. HINT: Some products can be
obtained in more than one way so be sure to only include it once in your sum.
###

_ = require './utils/underscore-min'

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


# all permutations
all = []

a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
# a = [1, 2, 3, 4, 5]
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
###
console.log valueOf([3,6,2,9,1,4,5,8,7])
console.log valueOf([3,6,2,9,1,4,5,8,7][4..]  )
console.log valueOf([3,6,2,9,1,4,5,8,7][0...2]  )
console.log valueOf([3,6,2,9,1,4,5,8,7][2...4]  )

console.log valueOf([3,6,2,9,1,4,5,8,7][5..]  )
console.log valueOf([3,6,2,9,1,4,5,8,7][0...3]  )
console.log valueOf([3,6,2,9,1,4,5,8,7][3...5]  )

console.log valueOf([3,6,2,9,1,4,5,8,7][5..]  )
console.log valueOf([3,6,2,9,1,4,5,8,7][0...2]  )
console.log valueOf([3,6,2,9,1,4,5,8,7][2...5]  )
###

products = []
# lungimea lui product nu poate fi decat 4 sau 5 (euristic :-)
# test = all[1000..1010]
for perm in all
  [a1, b1, c1] = [ perm[0...2], perm[2...4], perm[4..] ]
  [a2, b2, c2] = [ perm[0...2], perm[2...5], perm[5..] ]
  [a3, b3, c3] = [ perm[0...3], perm[3...5], perm[5..] ]
  if valueOf(a1) * valueOf(b1) is valueOf(c1)
    console.log a1, b1, c1
    products.push valueOf(c1)
  if valueOf(a2) * valueOf(b2) is valueOf(c2)
    console.log a2, b2, c2
    products.push valueOf(c2)
  if valueOf(a3) * valueOf(b3) is valueOf(c3)
    console.log a3, b3, c3
    products.push valueOf(c3)

console.log "Distinct products obtained:"
console.log _.unique(products)

result = 0
for p in products
  result += p
console.log "The sum of products: #{result}"

### TODO nu merge
# The Counting QuickPerm Algorithm:

#    let a[] represent an arbitrary list of objects to permute
#    let N equal the length of a[]
#    create an integer array p[] of size N to control the iteration       
#    initialize p[0] to 0, p[1] to 0, p[2] to 0, ..., and p[N-1] to 0
#    initialize index variable i to 1
#    while (i < N) do {
#       if (p[i] < i) then {
#          if i is odd, then let j = p[i] otherwise let j = 0
#          swap(a[j], a[i])
#          increment p[i] by 1
#          let i = 1 (reset i to 1)
#       } // end if
#       else { // (p[i] equals i)
#          let p[i] = 0 (reset p[i] to 0)
#          increment i by 1
#       } // end else (p[i] equals i)
#    } // end while (i < N)
#    

p = []
for n in [0...N] # exclusive range
  p[n] = 0
i = 1
while i < N
  if p[i] < i
    if i % 2 is 1
      j = p[i]
    else
      j = 0
    [ a[j], a[i] ] = [ a[i], a[j] ]
    p[i]++
    i = 1
  else
    p[i] = 0
    i++
  # end if
  count++
  console.log count, a

console.log count
###
_ = require '../utils/underscore-min'

n = 20  # elements in array
x = _.random 1,n # needle

# build random array, haystack
A = []
for i in [1..n]
  A.push _.random 1,n
# A must be sorted
A = _.sortBy A, (x) -> x

A = [1,2,3,3,4,5,5,7,11,11,11,12,14,16,16,16,17,18,19,20]
x = 5

console.log "A: [#{A}]"
console.log "Searching for: #{x}"

binarySearch = (A, n, x) ->
  [p, r] = [0, n-1]
  while p <= r
    q = Math.floor (p + r) / 2
    if A[q] is x
      return q
    else if A[q] > x
      r = q - 1
    else
      p = q + 1
  return "NOT FOUND"

location = binarySearch A, n, x
console.log "#{x} was found at position: #{location}"

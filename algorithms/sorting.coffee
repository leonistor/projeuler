_ = require '../utils/underscore-min'

# elements in array
n = 20
# range of elements
MAX = n*n

# build random array
A = []
for i in [1..n]
  A.push _.random 1,MAX

console.log "A: [#{A}]"

selectionSort = (A, n) ->
  console.log "selection sort"
  for i in [0..n-2]
    # console.log "i: #{i}, A: #{A}"
    smallest = i
    # Set smallest to the index of the smallest element in the subarray to the right
    for j in [i+1..n-1]
      if A[j] < A[smallest]
        smallest = j
    # console.log "smallest: #{A[smallest]}"
    # swap A[i] with A[smallest]
    [A[i], A[smallest]] = [A[smallest], A[i]]
  console.log "A: [#{A}]"

insertionSort = (A, n) ->
  console.log "insertion sort"
  for i in [1..n-1]
    key = A[i]
    j   = i - 1
    while j >= 0 and A[j] > key
      A[j+1] = A[j]
      j--
    A[j+1] = key
  console.log "A: [#{A}]"

# peform sort on copies of A
selectionSort A[..], n
insertionSort A[..], n

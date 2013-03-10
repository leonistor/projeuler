###
Problem 24
Lexicographic permutations

A permutation is an ordered arrangement of objects. For example, 3124
is one possible permutation of the digits 1, 2, 3 and 4. If all of the
permutations are listed numerically or alphabetically, we call it
lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits 0, 1, 2,
3, 4, 5, 6, 7, 8 and 9?
###

_ = require './utils/underscore-min'

digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

###
# shamelessly teaken from http://rosettacode.org/wiki/Permutations#CoffeeScript
###

# Returns a copy of an array with the element at a specific position
# removed from it.
arrayExcept = (arr, idx) ->
  res = arr[0..]
  res.splice idx, 1
  res
 
# The actual function which returns the permutations of an array-like
# object (or a proper array).
permute = (arr) ->
  arr = Array::slice.call arr, 0
  return [[]] if arr.length == 0
 
  permutations = (for value,idx in arr
    [value].concat perm for perm in permute arrayExcept arr, idx)
 
  # Flatten the array before returning it.
  [].concat permutations...

all = permute digits

for row, index in all
  if index + 1 in [1000000, 50]
    console.log index+1, row.join()
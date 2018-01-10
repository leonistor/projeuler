###

Problem 4
Largest palindrome product

A palindromic number reads the same both ways. The largest palindrome made from 
the product of two 2-digit numbers is 9009 = 91 x 99.
Find the largest palindrome made from the product of two 3-digit numbers.

###

isPalindrome = (n) ->
  s = n.toString().split('')
  mid = s.length / 2
  len = s.length
  for i in [0...mid]
    if s[i] != s[len-i-1]
      return false
  true

# console.log isPalindrome(9876789)

[largest, a, b] = [1, 1, 1]

for i in [999..100] by -1
  for j in [0..998]
    if isPalindrome(i*j)
      if largest < i*j
        [largest, a, b] = [i*j, i, j]

console.log "largest palindrome is #{largest} made of #{a} * #{b}"
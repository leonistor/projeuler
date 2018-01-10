###
Problem 36
Double-base palindromes

The decimal number, 585 = 1001001001 base 2 (binary), is palindromic
in both bases. Find the sum of all numbers, less than one million,
which are palindromic in base 10 and base 2. (Please note that the
palindromic number, in either base, may not include leading zeros.)
###

# ha! ha! de la pb 4, merge neschimbata si daca n e deja string. muhahaha
isPalindrome = (n) ->
  s = n.toString().split('')
  mid = s.length / 2
  len = s.length
  for i in [0...mid]
    if s[i] != s[len-i-1]
      return false
  true

sum = 0
for i in [1...1000000]
  bin = i.toString(2)
  if isPalindrome(i) and isPalindrome(bin)
    console.log i, bin
    sum += i

console.log "The sum is #{sum}"
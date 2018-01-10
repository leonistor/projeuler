###
Problem 55
Lychrel numbers

If we take 47, reverse and add, 47 + 74 = 121, which is palindromic.

Not all numbers produce palindromes so quickly. For example,

349 + 943 = 1292,
1292 + 2921 = 4213
4213 + 3124 = 7337

That is, 349 took three iterations to arrive at a palindrome.

Although no one has proved it yet, it is thought that some numbers,
like 196, never produce a palindrome. A number that never forms a
palindrome through the reverse and add process is called a Lychrel
number. 

Due to the theoretical nature of these numbers, and for the
purpose of this problem, we shall assume that a number is Lychrel
until proven otherwise. 
In addition you are given that for every number below ten-thousand, 
it will either 
(i) become a palindrome in less than fifty iterations, or, 
(ii) no one, with all the computing power that exists, has managed so
far to map it to a palindrome. In fact, 10677 is the first number to
be shown to require over fifty iterations before producing a
palindrome: 4668731596684224866951378664 (53 iterations, 28-digits).

Surprisingly, there are palindromic numbers that are themselves
Lychrel numbers; the first example is 4994.

How many Lychrel numbers are there below ten-thousand?

NOTE: Wording was modified slightly on 24 April 2007 to emphasise the
theoretical nature of Lychrel numbers.
###


big = require('./utils/biginteger').BigInteger

TEN_THOUSAND = 10000

isPalindrome = (n) ->
  s = n.toString().split('')
  mid = s.length / 2
  len = s.length
  for i in [0...mid]
    if s[i] != s[len-i-1]
      return false
  true

# console.log isPalindrome("4668731596684224866951378664")
# console.log isPalindrome(4668731596684224866951378664)

# n = big("4668731596684224866951378664")
# console.log n.toString()
# console.log isPalindrome(n)

# n = big(2)
# for i in [2..TEN_THOUSAND]
#   n = n.multiply(i)
#   console.log i, n.toString()

count = 0

for i in [1...TEN_THOUSAND]
  
  num   = big(i)
  step  = 0
  found = false

  while (not found) and (step < 50)
    step++
    mun = big( num.toString().split('').reverse().join('') )
    num = num.add(mun)
    if isPalindrome(num)
      found = true
  
  if found
    console.log "#{i} produces #{num.toString()} in #{step} steps"
  else
    count++
    console.log "#{i} is Lychrel"

console.log "Found #{count} Lychrel numbers"

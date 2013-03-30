###
Problem 74
Digit factorial chains

The number 145 is well known for the property that the sum of the factorial of
its digits is equal to 145:

1! + 4! + 5! = 1 + 24 + 120 = 145

Perhaps less well known is 169, in that it produces the longest chain of
numbers that link back to 169; it turns out that there are only three such
loops that exist:

169 -> 363601 -> 1454 -> 169
871 -> 45361 -> 871
872 -> 45362 -> 872

It is not difficult to prove that EVERY starting number will eventually get
stuck in a loop. For example,

69 -> 363600 -> 1454 -> 169 -> 363601 (-> 1454)
78 -> 45360 -> 871 -> 45361 (-> 871)
540 -> 145 (-> 145)

Starting with 69 produces a chain of five non-repeating terms, but the longest
non-repeating chain with a starting number below one million is sixty terms.

How many chains, with a starting number below one million, contain exactly
sixty non-repeating terms?
###

_ = require './utils/underscore-min'

# 0! = 1
factorials = [1]

for d in [1..9]
  f = 1
  for i in [1..d]
    f *= i
  factorials[d] = f
# console.log factorials

digitFactorial = (n) ->
  # console.log "---", n
  ret = 0
  s = n.toString().split('').slice().map( (d) -> parseInt(d, 10) )
  for d in s
    # console.log d, factorials[d]
    ret += factorials[d]
  ret
# console.log digitFactorial(169)
# console.log digitFactorial(363601)
# console.log digitFactorial(1454)
# console.log digitFactorial(871)
# console.log digitFactorial(45361)
# console.log digitFactorial(872)
# console.log digitFactorial(45362)
# console.log digitFactorial(69)


funnyChain = (n) ->
  chain = [n]
  N = n
  found = false
  while not found
    next = digitFactorial(n)
    if (where = _.indexOf(chain, next)) isnt -1
      found = true
    chain.push next
    n = next
  # console.log chain
  chain.length - 1
# console.log funnyChain(169)
# console.log funnyChain(871)
# console.log funnyChain(69)
# console.log funnyChain(78)
# console.log funnyChain(540)

count = 0
for n in [1...1000000]
  if funnyChain(n) is 60
    count++
  if n % 10000 is 0
    console.log n

console.log count

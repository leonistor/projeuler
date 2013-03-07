###
Problem 14
Longest Collatz sequence

The following iterative sequence is defined for the set of positive integers:

n -> n/2 (n is even)
n -> 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:
13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1

It can be seen that this sequence (starting at 13 and finishing at 1) 
contains 10 terms. Although it has not been proved yet (Collatz Problem), it is 
thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
###

nextCollatz = (n) ->
  if n > 1
    if n % 2 == 0
      return n / 2
    else
      return 3 * n + 1
  else
    return 1
  1

stopNum = 1000000
stepMap = []

stepMap[1] = 3
stepMap[2] = 1
stepMap[3] = 7
stepMap[4] = 2
stepMap[5] = 5
stepMap[6] = 8

theNumber = theSteps = 0

for i in [7...stopNum]
  steps = 0
  n = i
  found = false
  while (n != 1) and not found
    n = nextCollatz n
    steps++
    if stepMap[n]?
      steps = steps + stepMap[n]
      found = true
  stepMap[i] = steps 

  if steps >= theSteps
    [theSteps, theNumber] = [steps, i]

console.log "Finally: #{theSteps} steps for #{theNumber}"


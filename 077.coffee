###
Problem 77
Prime summations

It is possible to write ten as the sum of primes in exactly five different ways:

7 + 3
5 + 5
5 + 3 + 2
3 + 3 + 2 + 2
2 + 2 + 2 + 2 + 2

What is the first value which can be written as the sum of primes in over 
five thousand different ways?
###

###
cheat
http://www.mathblog.dk/project-euler-77-sum-of-primes-five-thousand-ways/
###

isPrime = require("./utils/utils").isPrime
_ = require './utils/underscore-min'

target = 2
primes = []
for i in [2..100]
  if isPrime(i)
    primes.push i

console.log primes

gata = false
while not gata
  ways = []
  for i in [0..target]
    ways[i] = 0
  ways[0] = 1

  for i in primes
    for j in [i..target]
      ways[j] += ways[j-i]

  if ways[target] > 5000
    gata = true
    for w, i in ways
      console.log i, w
  target++

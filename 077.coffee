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

isPrime = require("./utils/utils").isPrime

num = 100
prime = []

for i in [2..num]
  if isPrime(i)
    prime.push i
console.log prime

         #0  1  2  3  4
feluri = [0, 0, 1, 1, 2]
for i in [5..num]
  feluri[i] = 0
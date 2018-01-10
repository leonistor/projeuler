###
Problem 76
Counting summations

It is possible to write five as a sum in exactly six different ways:

4 + 1
3 + 2
3 + 1 + 1
2 + 2 + 1
2 + 1 + 1 + 1
1 + 1 + 1 + 1 + 1

How many different ways can one hundred be written as a sum of at least two
positive integers?
###

num = 100
feluri = [1]

for i in [1..num]
  feluri[i] = 0

for i in [1...num]
  for j in [i..num]
    feluri[j] += feluri[j-i]

for f, i in feluri
  console.log i, f
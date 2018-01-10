###
Problem 53
Combinatoric selections

There are exactly ten ways of selecting three from five, 12345:

123, 124, 125, 134, 135, 145, 234, 235, 245, and 345

In combinatorics, we use the notation, 5C3 = 10.

In general,
nCr = n! / r!(n-r)! ,where r <= n, n! = nx(n-1)x...x3x2x1, and 0! = 1.

It is not until n = 23, that a value exceeds one-million: 23C10 = 1144066.

How many, not necessarily distinct, values of nCr, for 1 <= n <= 100, 
are greater than one-million?
###

# hmmm! coeficienti binomiali, deci...

ONE_MILLION = Math.pow(10,6)

pascal = []
pascal[0] = [1]
pascal[1] = [1, 1]

count = 0

for n in [2..100]
  pascal[n] = [1]
  for r in [1..n]
    # console.log n, r, pascal[n-1][r-1], (pascal[n-1][r] or 0)
    c = pascal[n-1][r-1] + (pascal[n-1][r] or 0)
    pascal[n].push c
    if c > ONE_MILLION
      count++

# console.log pascal
console.log count


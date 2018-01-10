###
Problem 46
Goldbach's other conjecture

It was proposed by Christian Goldbach that every odd composite number
can be written as the sum of a prime and twice a square.

9 = 7 + 2x1^2
15 = 7 + 2x2^2
21 = 3 + 2x3^2
25 = 7 + 2x3^2
27 = 19 + 2x2^2
33 = 31 + 2^1^2

It turns out that the conjecture was false.

What is the smallest odd composite that cannot be written as the sum of 
a prime and twice a square?
###

isPrime = require("./utils/utils").isPrime

i = 4
goldbach = false


loop
  n = 2 * i + 1
  if not isPrime(n)
    console.log "Checking #{n}"
    goldbach = false
    max = Math.sqrt( (n-2)/2 )
    j = 1
    while j < max
      rest = n - 2 * j*j
      # console.log n, 2*j*j, rest 
      if isPrime(rest)
        console.log "#{n} = #{rest} + 2 * #{j}^2"
        goldbach = true
        break
      j++
  i++
  if not goldbach
    break


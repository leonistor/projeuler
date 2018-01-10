###
Problem 7
1001 Prime

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that 
the 6th prime is 13. What is the 10001st prime number?
###

isPrime = (n) ->
  i = 2
  while (n != 1) and (i <= Math.sqrt(n))
    if n%i == 0
      return false
    i++
  true

# ok
# console.log isPrime(4398042316799)
# ok
# console.log isPrime(1125899839733759)
# buba! la asta wikipedia zice ca e prim: http://en.wikipedia.org/wiki/List_of_prime_numbers#The_first_500_prime_numbers 
# console.log isPrime(18014398241046527)

count = 6
n     = 13

while count <= 10001
  if isPrime(n)
    console.log "#{n} is the #{count}th prime"
    count++
  n++
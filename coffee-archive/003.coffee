###

Problem 3
Largest prime factor

The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?

###

n = 600851475143
# n = 7879 * 5 * 5 * 5 * 7

console.log "calculam largest prime factor pentru numarul: ", n

i = 2
while n != 1
  if n%i == 0
    n /= i
    console.log i
  i++

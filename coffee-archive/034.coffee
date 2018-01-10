###
Problem 34
Digit factorials

145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
###

# returns n!
factorial = (n) ->
  ret = 1
  while n > 1
    ret *= n
    n--
  ret

# digit factorials
df = []
df[0] = 1
for n in [1..9] 
  df[n] = factorial(n)

numbers = []
sum = 0
for i in [3..df[9]*100000]
  s = i.toString().split('').map( (digit) -> parseInt(digit, 10) )
  # console.log i, s
  digitFactorialSum = 0
  for digit in s
    digitFactorialSum += df[digit]
  if i % 1000000 is 0 
    console.log i, digitFactorialSum, numbers
  if i is digitFactorialSum
    numbers.push i
    console.log i
    sum += i

console.log numbers
console.log "Sum is #{sum}"
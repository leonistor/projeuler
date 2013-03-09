###
Problem 20
Factorial digit sum

n! means n x (n − 1) x ... x 3 x 2 x 1

For example, 10! = 10 x 9 x ... x 3 x 2 x 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
###

number = [1]
sum = 0
n = 101

for i in [1...n]
  overflow = 0
  count = number.length + 2
  for j in [0...count]
    digit = if number[j]? then number[j] else 0
    digit = i * digit + overflow
    if digit > 9
      overflow = (digit - (digit % 10)) / 10
      digit = digit % 10
    else
      overflow = 0
    number[j] = digit
  # console.log i, number

for x in number
  sum += x

# console.log "lungime:", number.length
console.log sum
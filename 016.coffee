###
Problem 16
Power digit sum

2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
What is the sum of the digits of the number 2^1000?
###

n = Math.pow(2, 1000)

if n < Number.MAX_VALUE
  console.log n, "suntem in grafic"

# rushinica: solutia de aici
# http://stackoverflow.com/questions/9834037/solving-project-euler-16-with-javascript?lq=1

number = [1]
sum = 0

for i in [0...1000]
  overflow = 0
  count = number.length + 1
  for j in [0...count]
    digit = if number[j]? then number[j] else 0
    digit = 2 * digit + overflow
    if digit > 9
      digit -= 10
      overflow = 1
    else
      overflow = 0
    number[j] = digit

for i in [0...1000]
  sum += number[i]

console.log sum

###
Problem 30
Digit fifth powers

Surprisingly there are only three numbers that can be written as the
sum of fourth powers of their digits:

    1634 = 1^4 + 6^4 + 3^4 + 4^4
    8208 = 8^4 + 2^4 + 0^4 + 8^4
    9474 = 9^4 + 4^4 + 7^4 + 4^4

As 1 = 1^4 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of
fifth powers of their digits.

###

POW = 5

powers = []
for i in [0..9]
  powers.push Math.pow(i, POW)
# console.log powers

digitPower = (num) ->
  s = num.toString()#.split('')
  sum = 0
  for i in s
    sum += Math.pow(i, POW)
  sum

# console.log digitPower(1634)
# console.log digitPower(8208)
# console.log digitPower(9474)

sum = 0
MAX = 10000000 # de vazut de ce
for num in [10..MAX]
  if num % (MAX/10) is 0 
    console.log num
  if num is digitPower(num)
    console.log "Found:", num
    sum += num

console.log "Sum is #{sum}"


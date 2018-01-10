###
Problem 48
Self powers

The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
###

# pe baza la pb 25 si 20
# doar ca ne ocupam numai de ultimii 10 digits, nu de tot numarul

# return last 10 digits of x^x, in reversed order
# achtung: nu merge pentru numere x mari, reprezentate cu exp, 
last10 = (x) ->
  number = x.toString().split('').map( (d) -> parseInt(d, 10) ).reverse()
  for i in [1...x]
    overflow = 0
    for j in [0...15] # calculate to last 15 digits, to get late big overflows
      digit = x * (number[j] or 0) + overflow
      # console.log "***", i+1, number, j, digit, overflow
      if digit > 9
        overflow = (digit - (digit % 10)) / 10
        digit = digit % 10
      else
        overflow = 0
      number[j] = digit
  # end for i
  return number[0..9]
# end last10

# last 10 digits of n^n
pow10 = []
sum = [0]
for n in [1..1000]
  num = last10(n)

  # add num to sum
  overflow = 0
  for i in [0..9]
    digit = (num[i] or 0) + (sum[i] or 0) + overflow
    overflow = 0
    if digit > 9
      # now it's safe to assume that max is 9+9
      digit = digit - 10
      overflow = 1
    sum[i] = digit
  # end for i
# end for n

console.log sum
console.log "Result: " + sum.reverse().join('')

# aaarrgh!!!
# folosim https://defuse.ca/big-number-calculator.htm = online
# Math.pow(15,13) = 1946195068359375
# online: 1 946 195 068 359 375
# ok
# la urmatoarea inmultire cu 15 ar trebui sa avem 5 in coada, dar...
# Math.pow(15,14) = 29192926025390624
# online: 29 192 926 025 390 625
console.log "fucking floating precision"
# coffee> 0.1 * 0.2
# 0.020000000000000004
# vezi http://stackoverflow.com/questions/1458633/elegant-workaround-for-javascript-floating-point-number-problem
# foloseste de la JS FROM HELL :-)
# http://jsfromhell.com/classes/bignumber



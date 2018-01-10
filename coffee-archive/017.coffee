###
Problem 17
Number letter counts

If the numbers 1 to 5 are written out in words: one, two, three, four, five, 
then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 
(one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
###

ones  = ['','one','two','three','four','five','six','seven','eight','nine']
teens = ['ten','eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen']
tens  = ['','','twenty','thirty','forty','fifty','sixty','seventy','eighty','ninety']

words = (n) ->
  if n < 1 or n > 1000
    return "ERR: #{n} out of range"
  else if n >= 1 and n <= 9
    return ones[n]
  else if n >= 10 and n <= 19
    return teens[n-10]
  else if n >= 20 and n <= 99
    figures = ('' + n).split('')
    return tens[+figures[0]] + ones[+figures[1]]
  else if n >=100 and n <= 999
    figures = ('' + n).split('')
    str = ones[+figures[0]] + 'hundred'
    if n % 100 != 0
      str += 'and'
      # z = if figures[1] then +figures[1] else 0
      z = +figures[1] ?= 0
      # u = if figures[2] then +figures[2] else 0
      u = +figures[2] ?= 0
      # console.log figures, z, u
      str += words( z * 10 + u )
    return str 
  else if n == 1000
    return 'onethousand'

sum = 0

for i in [1..1000]
  # console.log i, words(i), words(i).length
  sum += words(i).length

console.log sum

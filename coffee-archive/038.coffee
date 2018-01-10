###
Problem 38
Pandigital multiples

Take the number 192 and multiply it by each of 1, 2, and 3:

    192 x 1 = 192
    192 x 2 = 384
    192 x 3 = 576

By concatenating each product we get the 1 to 9 pandigital, 192384576.
We will call 192384576 the concatenated product of 192 and (1,2,3)

The same can be achieved by starting with 9 and multiplying by 1, 2,
3, 4, and 5, giving the pandigital, 918273645, which is the
concatenated product of 9 and (1,2,3,4,5).

What is the largest 1 to 9 pandigital 9-digit number that can be
formed as the concatenated product of an integer with (1,2, ... , n)
where n > 1?
###

_ = require './utils/underscore-min'

isPandigital9 = (n) ->
  if n.toString().length isnt 9
    return false
  digits9 = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
  num = ('' + n).split('')
  diff = _.difference(digits9, num)
  # console.log diff
  if _.isEmpty(diff)
    return true
  else
    return false

# value for array of digits
valueOf = (arr) ->
  ret = 0
  l = arr.length ? 0
  for pos in [0...l]
    ret += Math.pow(10, l-pos-1) * arr[pos]
  ret

numSize = (n) ->
  ('' + n).split('').length

digitArr = (n) ->
  n.toString().split('').map( (d) -> parseInt(d, 10) )  

n = 192

maxProd = 0

for n in [1..100000]
  for i in [1..9]
    prod = ''
    concatProd = []
    for j in [1..i]
      prod += '' + n*j
      concatProd = concatProd.concat digitArr(n * j)
    if concatProd.sort().toString() is "1,2,3,4,5,6,7,8,9"
      console.log "#{prod} pentru #{n} si 1..#{i}"

# cu ochiul, fara maxProd: 932718654












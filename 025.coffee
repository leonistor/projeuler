###
Problem 25
1000-digit Fibonacci number

The Fibonacci sequence is defined by the recurrence relation:

    Fn = Fn-1 + Fn-2, where F1 = 1 and F2 = 1.

Hence the first 12 terms will be:

    F1 = 1
    F2 = 1
    F3 = 2
    F4 = 3
    F5 = 5
    F6 = 8
    F7 = 13
    F8 = 21
    F9 = 34
    F10 = 55
    F11 = 89
    F12 = 144

The 12th term, F12, is the first term to contain three digits.

What is the first term in the Fibonacci sequence to contain 1000 digits?
###

addX = (a, b) ->
  if a.length == b.length
    if a[a.length-1] > b[b.length-1]
      small = a
      large = b
    else
      small = b
      large = a
  else 
    if a.length > b.length
      small = b
      large = a
    else
      small = a
      large = b
  # console.log "s, l", small, large
  overflow = 0
  for i in [0..large.length-1]
    # console.log i, large[i], (small[i] or 0), overflow
    digit = (large[i] or 0) + (small[i] or 0) + overflow
    overflow = 0
    if digit > 9
      digit = digit - 10
      overflow = 1
    large[i] = digit
  if overflow > 0
    large[large.length] = overflow
# end addX


valueX = (n) ->
  n.slice().reverse().join('').toString()

a = [1]
b = [1]
step = 3
count = 1
while count <= 998
  if step % 2 is 0
    large = a
    small = b
  else
    large = b
    small = a
  overflow = 0
  count = Math.max(large.length, small.length)-1
  for i in [0..count]
    # console.log i, large[i], (small[i] or 0), overflow
    digit = (large[i] or 0) + (small[i] or 0) + overflow
    overflow = 0
    if digit > 9
      digit = digit - 10
      overflow = 1
    large[i] = digit
  if overflow > 0
    large[large.length] = overflow

  if step % 2 is 0
    console.log step, valueX(a), a.length
  else
    console.log step, valueX(b), b.length
  step++






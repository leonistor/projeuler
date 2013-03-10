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

# a = [0, 5, 2]
# b = [0, 5, 8, 1]

# a = [0,4,8,1,7,8,0,4,6,6,6,9,0,9,9,4,5,2,9,5,3,8,5,3,5]
# b = [1,2,9,1,5,0,8,5,6,8,4,9,7,0,5,8,9,3,7,0,0,0,7,6,8]

addX = (small, large) ->
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

valueX = (n) ->
  n.slice().reverse().join('').toString()

###
console.log "a", a
console.log valueX(a)
console.log "b", b
console.log valueX(b)
aa = parseInt(valueX(a), 10)
bb = parseInt(valueX(b), 10)
console.log aa, bb, aa + bb

addX(a, b)

console.log "AFTER:"
console.log "a", a
console.log valueX(a)
console.log "b", b
console.log valueX(b)
###

###
a = [8]
b = [3, 1]

addX(a, b)

console.log b, valueX(b)
console.log b
###

a = [1]
b = [1]
step = 3

while step <=32
  if step % 2 isnt 0
    addX(a, b)
    console.log step, a, "*", b 
#    console.log valueX(b)
  else
    addX(b, a)
    console.log step, "*", a, b
#    console.log valueX(a)
  step++

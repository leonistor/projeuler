###
Problem 40
Champernowne's constant

An irrational decimal fraction is created by concatenating the 
positive integers:

0.123456789101112131415161718192021...

It can be seen that the 12th digit of the fractional part is 1.
If dn represents the nth digit of the fractional part, find the value of 
the following expression.

d1 x d10 × d100 × d1000 × d10000 × d100000 × d1000000

###

d = 'x' # he he, sa nu mai numaram cu 0-based index, ci cu 1-based
MAX = 1000000
SAFE = 100
i = 1
while d.length < MAX + SAFE
  d += '' + i
  i++

console.log d[1], d[10], d[100], d[1000], d[10000], d[100000], d[1000000]

p = d[1] *
    d[10] *
    d[100] *
    d[1000] *
    d[10000] *
    d[100000] *
    d[1000000]

console.log "P is #{p}"
###
Problem 28
Number spiral diagonals

Starting with the number 1 and moving to the right in a clockwise
direction a 5 by 5 spiral is formed as follows:

21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001
spiral formed in the same way? 
###

SIZE = 1001 # odd number, careful with .. or ... ranges!
s = []

# initialize spiral matrix with 0
for i in [0...SIZE]
  s[i] = []
  for j in [0...SIZE]
    s[i][j] = 0

# print the spiral
printSpiral = () ->
  SEP = '|'   # cell separator
  for i in [0...SIZE]
    row = s[i]
    out = '' + SEP
    for cell in row
      if cell is 0
        out += ' 0'
      else if cell > 0 and cell < 10
        out += ' ' + cell
      else if cell >=10 and cell < 100
        out += '' + cell
      else 
        out += '##'
      out += SEP
    console.log out
  # for ends here
  true

# start number
count = 1

# matrix center
base = Math.ceil(SIZE / 2) - 1
s[base][base] = count

# max "radius" of spiral, assume SIZE odd value
radius = (SIZE - 1) / 2

# build the spiral
for r in [1..radius]
  # console.log "r = #{r}"

  # up -> down
  for i in [-r+1..r]
    count++
    # console.log "i=#{i}  s[#{base+i}][#{base+r}] = #{count}"
    s[base+i][base+r] = count

  # right - > left
  for i in [-r+1..r]
    count++
    # console.log "i=#{i}  s[#{base+r}][#{base-i}] = #{count}"
    s[base+r][base-i] = count

  # down -> up
  for i in [-r+1..r]
    count++
    # console.log "i=#{i}  s[#{base-i}][#{base-r}] = #{count}"
    s[base-i][base-r] = count

  # left -> right
  for i in [-r+1..r]
    count++
    # console.log "i=#{i}  s[#{base-r}][#{base+i}] = #{count}"
    s[base-r][base+i] = count

sum = s[base][base]
# calculate diagonals sum
for r in [1..radius]
  sum += s[base-r][base-r] + 
         s[base-r][base+r] + 
         s[base+r][base-r] + 
         s[base+r][base+r] 

console.log "Sum is #{sum}"

if SIZE < 25
  printSpiral()



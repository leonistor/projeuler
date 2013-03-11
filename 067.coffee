### 
Problem 67 
Maximum path sum II

By starting at the top of the triangle below and moving to adjacent
numbers on the row below, the maximum total from top to bottom is 23.

3
7 4
2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom in triangle.txt (right click
and 'Save Link/Target As...'), a 15K text file containing a triangle
with one-hundred rows. 
###

fs = require 'fs'

tri = []

# parse faile, after manually delete last empty line :-)
fs.readFileSync('./data/triangle.txt').toString().split('\n').
  forEach( (line, depth) ->
    tri[depth] = []
    row = line.split(' ').
      forEach( (num, index) -> 
        tri[depth][index] = parseInt(num, 10) 
      )
      # console.log tri[depth] if depth in [0..10]
      true
  )

for i in [tri.length-1..1]
  row = tri[i]
  for value, j in row when j isnt 0
    tri[i-1][j-1] += Math.max(tri[i][j], tri[i][j-1])

console.log "Maximum total is:", tri[0][0]

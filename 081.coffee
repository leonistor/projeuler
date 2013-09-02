### 
Problem 81
Path sum: two ways 

In the 5 by 5 matrix below, the minimal path sum from the top left to the
bottom right, by only moving to the right and down, is indicated in bold red
and is equal to 2427.

131 673 234 103 18
201 96  342 965 150
630 803 746 422 111
537 699 497 121 956
805 732 524 37  331

Find the minimal path sum, in matrix.txt (right click and 'Save Link/Target
As...'), a 31K text file containing a 80 by 80 matrix, from the top left to
the bottom right by only moving right and down.
###

_ = require './utils/underscore-min'

###
mText = [
  "131,673,234,103,18",
  "201,96,342,965,150",
  "630,803,746,422,111",
  "537,699,497,121,956",
  "805,732,524,37,331"
]

n   = 5
m   = []
s   = []

for line, x in mText
  m[x] = []
  s[x] = []
  l = line.split ","
  for e, y in l
    m[x][y] =  parseInt e, 10
    s[x][y] = Infinity
###

n = 80
m = require('./data/matrix.js').m

s = []
for i in [0...n]
  s[i] = []
  for j in [0...n]
    s[i][j] = Infinity

s[0][0]=m[0][0]

# console.log m
# console.log "----------"
# console.log s

###
console.log "test raze"
for r in [1..n-1]
  diag = ""
  for i in [0..r]
    diag += ""+ m[i][r-i] + " "
  console.log diag
for r in [1..n-1]
  diag = ""
  for i in [n-1..r]
    # console.log "#{i} #{n+r-i-1}"
    diag += ""+ m[n+r-i-1][i] + " "
  console.log diag
###

for r in [1..n-1]
  for i in [0..r]
    x = i
    y = r-i
    if x > 0
      if m[x][y] + s[x-1][y] < s[x][y]
        s[x][y] = m[x][y] + s[x-1][y]
    if y > 0
      if m[x][y] + s[x][y-1] < s[x][y]
        s[x][y] = m[x][y] + s[x][y-1]
for r in [1..n-1]
  for i in [n-1..r]
    x = n+r-i-1
    y = i
    if x > 0
      if m[x][y] + s[x-1][y] < s[x][y]
        s[x][y] = m[x][y] + s[x-1][y]
    if y > 0
      if m[x][y] + s[x][y-1] < s[x][y]
        s[x][y] = m[x][y] + s[x][y-1]

console.log s[n-1][n-1]

###
Problem 39
Integer right triangles

If p is the perimeter of a right angle triangle with integral length
sides, {a,b,c}, there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p <= 1000, is the number of solutions maximised?

###

solutions = []

for p in [3..1000]
  solutions[p] = 0
  for a in [1..p-2]
    for b in [1..p-a]
      c = p - a - b
      if c * c is a * a + b * b
        console.log "p: #{p} a: #{a}, b: #{b}, c: #{c}"
        solutions[p]++

maxP = maxNum = 0
for num, p in solutions
  if num isnt 0
    # console.log( p, num/2 )
    if num > maxNum
      maxNum = num
      maxP = p

console.log "#{maxP} has the larges number of solutions"
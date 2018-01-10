###
Problem 9
Special Pythagorean triplet

A Pythagorean triplet is a set of three natural numbers, 
a < b < c, for which a^2 + b^2 = c^2

For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which 
a + b + c = 1000. Find the product abc.
###

sum = 1000

for a in [1...sum]
  for b in [1...sum-a]
    c = sum - a - b
    [x, y, z] = [a, b, c].sort()
    # console.log a, b, c
    if (z*z == x*x + y*y)
      console.log "Pythagorean numbers found: #{a}, #{b}, #{c}, sum: #{a+b+c}, product: #{a*b*c}"
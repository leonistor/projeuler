###
Problem 15
Lattice paths

Starting in the top left corner of a 2x2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
How many such routes are there through a 20x20 grid?
###

# returns n!
factorial = (n) ->
  ret = 1
  while n > 1
    ret *= n
    n--
  ret

###
http://www.robertdickau.com/lattices.html

central binomial coefficients
(2n)! / n!^2
###

# start*(start+1)*...*(stop-1)*stop
product = (start, stop) ->
  if stop <= start
    return start
  else
    ret = 1
    for i in [start..stop]
      ret *= i
    return ret

# central binomial coefficients simplificata: (n+1)*(n+2)*...*(2n-1) / 3*4*...*(n-1) 
cbc = (n) ->
  product(n+1, 2*n-1) / product(3, n-1)

# pana aici merge brute force
# n = 12
# routes = factorial(2*n) / (factorial(n) * factorial(n))

n = 20
routes = cbc n
console.log "Routes for #{n} x #{n} grid: #{routes}"

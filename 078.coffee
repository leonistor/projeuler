###
Problem 78
Coin partitions

Let p(n) represent the number of different ways in which n coins can be 
separated into piles. For example, five coins can separated into piles 
in exactly seven different ways, so p(5)=7.

OOOOO
OOOO   O
OOO   OO
OOO   O   O
OO   OO   O
OO   O   O   O
O   O   O   O   O

Find the least value of n for which p(n) is divisible by one million.
###

###
http://www.mathblog.dk/project-euler-78-coin-piles/
wtf
http://en.wikipedia.org/wiki/Pentagonal_number_theorem#Example_program

###


pentagonal = (n) ->
  n * ( 3 * n - 1 ) / 2

generalized_pentagonal = (n) ->
  if n % 2 is 0
    return pentagonal( - n / 2 )
  else
    return pentagonal(  (n + 1) / 2 )

for n in [1..20]
  console.log n, generalized_pentagonal(n)


###
p = []
p.push 1

n = 1
gata = false
while not gata and n <= 20
  i = 0
  penta = 1
  p[n] = 0

  while penta <= n
    if i % 4 > 1
      sign = -1
    else
      sign = 1
    p[n] += sign * p[n - penta]
    # p[n] %= 1000000
    i++

    if i % 2 is 0
      j = - i / 2
    else
      j = (i + 1) / 2
    penta = j * (3 * j - 1) / 2
    console.log penta

  if p[n] is 0
    gata = true
  
  console.log n
  console.log p
  n++


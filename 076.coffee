###
Problem 76
Counting summations

It is possible to write five as a sum in exactly six different ways:

4 + 1
3 + 2
3 + 1 + 1
2 + 2 + 1
2 + 1 + 1 + 1
1 + 1 + 1 + 1 + 1

How many different ways can one hundred be written as a sum of at least two
positive integers?
###

###
1
1

2
1 1

3
2 1
1 1 1

4
3 1
2 2
2 1 1
1 1 1 1



5

4 1
3 2

3 1 1
2 2 1

2 1 1 1
1 1 1 1 1


6

5 1
4 2
3 3

4 1 1
3 2 1
2 2 2

3 1 1 1
2 2 1 1

2 1 1 1 1

1 1 1 1 1 1



7
6 1
5 2
4 3

5 1 1
4 2 1
3 3 1
3 2 2

4 1 1 1
3 2 1 1
2 2 2 1

3 1 1 1 1
2 2 1 1 1

2 1 1 1 1 1

1 1 1 1 1 1 1


8

7 1
6 2
5 3
4 4

6 1 1
5 2 1
4 3 1
4 2 2
3 3 2

5 1 1 1
4 2 1 1
3 3 1 1
3 2 2 1
2 2 2 2

4 1 1 1 1
3 2 1 1 1
2 2 2 1 1

3 1 1 1 1 1
2 2 1 1 1 1

2 1 1 1 1 1 1

1 1 1 1 1 1 1 1


9

8 1
7 2
6 3
5 4

7 1 1
6 2 1
5 3 1
5 2 2
4 3 2
3 3 3

6 1 1 1
5 2 1 1
4 3 1 1
4 2 2 1
3 3 2 1
3 2 2 2

5 1 1 1 1
4 2 1 1 1
3 3 1 1 1
3 2 2 1 1
2 2 2 2 1

4 1 1 1 1 1
3 2 1 1 1 1
2 2 2 1 1 1

3 1 1 1 1 1 1
2 2 1 1 1 1 1

2 1 1 1 1 1 1 1

1 1 1 1 1 1 1 1 1

###


scr = [] # scrieri de numere

scr[0] = [[]] # sa fie
scr[1] = [
  [],
  [1]
]
scr[2] = [
  [],
  [ [2] ],
  [ [1,1] ]
]
scr[3] = [
  [],
  [ [3] ],
  [ [2,1] ],
  [ [1,1,1] ]
]
scr[4] = [
  [],
  [ [4] ],
  [ [3,1], [2,2] ],
  [ [2,1,1] ],
  [ [1,1,1,1] ]
]

scriere = (n) ->
  count = 0
  console.log "#{n} poate fi scris ca:"
  for fel, lung in scr[n] when lung isnt 0 and lung isnt 1
    console.log " cu #{lung} cifre:"
    for f in fel
      console.log "  ", f
      count++
  console.log "#{n} poate fi scris in #{count} feluri"
# scriere(4)

for n in [5..9]
  scr[n] = []
  curent = scr[n]
  anterior = scr[n-1]

  curent[0] = []
  curent[1] = [ [n] ]
  curent[2] = []
  for c in [1..Math.floor(n/2)]
    curent[2].push [n-c,c]

  for fel in [3..n]
    curent[fel] = []
    for sursa in anterior[fel-1]
      curent[fel].push sursa[..].concat([1])
    # il pot scrie si cu 2 in coada?
    # pula, si daca ai la 9 pe 3 = 3,3,3 ???
    # nu merge
    if (n - 2) / (fel - 1) >= 2
      doi = []
      if n % 2 is 1
        doi = [3]
      else
        doi = [2]
      for c in [0..fel-2]
        doi.push 2
      curent[fel].push doi[..]

  scriere n


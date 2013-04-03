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


# num = 8

for num in [5..9]
  count = 0
  console.log "=== work: #{num}"
  for lung in [2..num]
    start = [num-lung+1]
    for i in [1..lung-1]
      start.push 1
    console.log start
    count++ # fiecare start e prima varianta de la scrierea cu lung termeni
    switch lung
      when 2
        for c in [2..Math.floor(num/2)]
          console.log [num-c, c]
          count++
      when num - 1
        console.log "2 111"
      when num
        console.log "111111"
      else
        # console.log "treaba:"
        gata = false
        celMult = Math.ceil(num/lung)
        console.log "#{lung} cu cel mult #{celMult}"
        while not gata
          # cautam pornirea
          max = incepe = 0
          for n, i in start
            if n >= max
              [max, incepe] = [n, i]
          # console.log "incepem cu #{max} de la #{incepe}"
          if start[incepe] > start[incepe+1]
            start[incepe]--
            start[incepe+1]++
          if start[incepe+1] <= start[incepe]
            console.log start
            count++
          if start[lung-2] is 2 and start[lung-1] is 1
            gata = true
          
        console.log "a ramas", start



  console.log "=== #{num} are #{count} variante"

###
1.
nu e bine transportul, vezi cazul 6111 la 9, iti scapa 4311
eventual cauta incepe de la coada
2.
conditia de gata nu e buna, ghideaza-te dupa celMult pe prima si 
a doua pozitie


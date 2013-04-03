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

num = 100
feluri = [1]

for i in [1..num]
  feluri[i] = 0

for i in [1...num]
  for j in [i..num]
    feluri[j] += feluri[j-i]

for f, i in feluri
  console.log i, f
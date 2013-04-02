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

_ = require './utils/underscore-min'

scrieri = []
scrieri[1] = [1]
scrieri[2] = [1, 1]
scrieri[3] = [
  [2, 1]
  [1, 1, 1]
]

console.log scrieri

###
num = 9
for lung in [2..num]
  start = [num-lung+1]
  for i in [1..lung-1]
    start.push 1
  console.log start

x = [1, 2, 3, 4]
console.log x[..-2]


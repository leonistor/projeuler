###
Problem 68
Magic 5-gon ring

Consider the following "magic" 3-gon ring, filled with the numbers 1
to 6, and each line adding to nine.

Working clockwise, and starting from the group of three with the
numerically lowest external node (4,3,2 in this example), each
solution can be described uniquely. For example, the above solution
can be described by the set: 4,3,2; 6,2,1; 5,1,3.

It is possible to complete the ring with four different totals: 9, 10,
11, and 12. There are eight solutions in total.

Total Solution Set
9 4,2,3; 5,3,1; 6,1,2
9 4,3,2; 6,2,1; 5,1,3
10  2,3,5; 4,5,1; 6,1,3
10  2,5,3; 6,3,1; 4,1,5
11  1,4,6; 3,6,2; 5,2,4
11  1,6,4; 5,4,2; 3,2,6
12  1,5,6; 2,6,4; 3,4,5
12  1,6,5; 3,5,4; 2,4,6

By concatenating each group it is possible to form 9-digit strings; the
maximum string for a 3-gon ring is 432621513.

Using the numbers 1 to 10, and depending on arrangements, it is possible to
form 16- and 17-digit strings. What is the maximum 16-digit string for a
"magic" 5-gon ring?
###

_ = require './utils/underscore-min'

# 3-gon ring
nums = [1..10]
solutions = []

for a in nums
  for b in nums when b not in [a]
    for c in nums when c not in [a,b]
      for d in nums when d not in [a,b,c]
        for e in nums when e not in [a,b,c,d]
          for f in nums when f not in [a,b,c,d,e]
            for g in nums when g not in [a,b,c,d,e,f]
              for h in nums when h not in [a,b,c,d,e,f,g]
                for i in nums when i not in [a,b,c,d,e,f,g,h]
                  for j in nums when j not in [a,b,c,d,e,f,g,h,i]
                    L1 = a + b + c
                    L2 = d + c + e
                    L3 = f + e + g
                    L4 = h + g + i
                    L5 = j + i + b
                    L  = L1 + L2 + L3 + L4 + L5
                    if L1 is L2 is L3 is L4 is L5
                      # console.log a, b, c, d, e, f, g, h, i, j
                      s = []
                      s.push(a, b, c, d, c, e, f, e, g, h, g, i, j, i, b)
                      console.log "-----"
                      console.log s
                      console.log s.length
                      n = s.join('')
                      console.log n
                      console.log n.length
                      if n.length is 16
                        solutions.push( [[a, b, c], [d, c, e], [f, e, g], [h, g, i], [j, i, b]] )
                        # console.log "#{L1}: #{a},#{b},#{c}; #{e},#{c},#{d}; #{f},#{d},#{b}"
                        # console.log n

console.log solutions
console.log solutions.length

groups = _.unique(solutions, false, (sol) ->
    s = _.map(sol, (set) -> set.join(''))
    s.sort().join('')
  )

console.log groups
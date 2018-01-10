###
Problem 65
Convergents of e

The square root of 2 can be written as an infinite continued fraction.
Hence the sequence of the first ten convergents for sqrt2 are:
1, 3/2, 7/5, 17/12, 41/29, 99/70, 239/169, 577/408, 1393/985, 3363/2378, ...

What is most surprising is that the important mathematical constant,
e = [2; 1,2,1, 1,4,1, 1,6,1 , ... , 1,2k,1, ...].

The first ten terms in the sequence of convergents for e are:
2, 3, 8/3, 11/4, 19/7, 87/32, 106/39, 193/71, 1264/465, 1457/536, ...

The sum of digits in the numerator of the 10th convergent is 1+4+5+7=17.

Find the sum of digits in the numerator of the 100th convergent of the 
continued fraction for e.
###

# http://www.math.mun.ca/~sergey/Research/Misc/contfrac_e.pdf

big = require('./utils/biginteger').BigInteger


P0 = big(1)
Q0 = big(0)

P1 = big(2)
Q1 = big(1)

P = big(0)
Q = big(0)

i = 2
while i<=100
  if i % 3 is 0
    k = i/3
    # [P, Q] = [2 * k * P1 + P0, 2 * k * Q1 + Q0]
    P = big.add(P1).multiply(2*k).add(P0)
    Q = big.add(Q1).multiply(2*k).add(Q0)
  else
    # [P, Q] = [P1 + P0, Q1 + Q0]
    P = big.add(P0).add(P1)
    Q = big.add(Q0).add(Q1)
  # console.log "0: #{P0.toString()}, #{Q0.toString()}"
  # console.log "1: #{P1.toString()}, #{Q1.toString()}"

  # digits sum
  s = P.toString().split('')
  sum = 0
  for d in s
    sum += parseInt(d, 10)

  console.log "#{i} : #{P.toString()} / #{Q.toString()}"
  console.log "Numerator sum: #{sum}"

  # [P1, P0] = [P, P1]
  P0 = big(P1)
  P1 = big(P)
  # [Q1, Q0] = [Q, Q1]
  Q0 = big(Q1)
  Q1 = big(Q)
  # console.log  "----"
  i++
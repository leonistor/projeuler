###
Problem 31
Coin sums

In England the currency is made up of pound, L, and pence, p, and
there are eight coins in general circulation:

    1p, 2p, 5p, 10p, 20p, 50p, L1 (100p) and L2 (200p).

It is possible to make L2 in the following way:

    1xL1 + 1x50p + 2x20p + 1x5p + 1x2p + 3x1p

How many different ways can L2 be made using any number of coins?
###

P1   = 1
P2   = 2
P5   = 5
P10  = 10
P20  = 20
P50  = 50
L1   = 100
L2   = 200

SUM = 200

count = 0
for l2 in [0..SUM/L2]
  for l1 in [0..SUM/L1]
    for p50 in [0..SUM/P50]
      for p20 in [0..SUM/P20]
        for p10 in [0..SUM/P10]
          for p5 in [0..SUM/P5]
            for p2 in [0..SUM/P2]
              for p1 in [0..SUM/P1]
                if l2*L2 + l1*L1 + p50*P50 + p20*P20 + p10*P10 + p5*P5 + p2*P2 + p1*P1 is SUM
                  count++
                  if count % 1000 is 0
                    console.log "#{l2}*L2 + #{l1}*L1 + #{p50}*P50 + #{p20}*P20 + #{p10}*P10 + #{p5}*P5 + #{p2}*P2 + #{p1}*P1"

console.log count
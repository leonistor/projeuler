module Main where

import Data.Numbers.Primes
import Data.Numbers
import Data.List

main :: IO ()
main = do
  putStrLn $ show (smallestDividedByEach 20)

smallestDividedByEach n =
  product $ map (\(fac,pow) -> fac^pow) biggestFactors
  where
    factors = tail $ map (group . sort . primeFactors) [1..n]
    countedFactors = sort $ concat [ map count z | z <- factors ]
    groupedFactors = groupBy (\(a,b) (x,y) -> a == x) countedFactors
    biggestFactors = map last groupedFactors

count :: [a] -> (a, Int)
count xs = (head xs, length xs)

{-
compare to solution from https://wiki.haskell.org/Euler_problems/1_to_10
problem_5 = foldr1 lcm [1..20]
Haskell rules!
-}

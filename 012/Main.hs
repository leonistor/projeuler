module Main where

import Primes(primeFactors)
import Data.List

main :: IO ()
main = putStrLn $ show result

result :: Integer
result = head $ dropWhile (\n -> numDivisors n <= 500) triangle

triangle :: [Integer]
triangle = [ (i * (i + 1)) `div` 2 | i <- [1..]]

-- https://wiki.haskell.org/Euler_problems/11_to_20
numDivisors :: Integer -> Int
numDivisors n = product $ map ((+1) . length) (group (primeFactors n))



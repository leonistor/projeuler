-- Problem 3
-- The prime factors of 13195 are 5, 7, 13 and 29.
-- What is the largest prime factor of the number 600851475143

module Main (main) where

import Data.Numbers.Primes

main :: IO ()

main = do
  putStrLn $ show $ head $ reverse $ primeFactors 600851475143

-- 6857

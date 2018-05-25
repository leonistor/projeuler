module Main where

import Data.Numbers.Primes

main :: IO ()
main = do
  putStrLn "hello world"

theNthPrime n =
  last $ take n primes

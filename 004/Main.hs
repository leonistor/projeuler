-- Problem 4
-- A palindromic number reads the same both ways. The largest palindrome made from 
-- the product of two 2-digit numbers is 9009 = 91 × 99.
-- Find the largest palindrome made from the product of two 3-digit numbers.

module Main (main) where

import Data.List

digits :: [Int]
digits = [100..999]

products :: [Int]
products = [ x * y | x <- digits, y <- digits ]

isPalindrome :: Int -> Bool
isPalindrome num =
  s == reverse s
  where s = show num

main :: IO ()

main = do
  putStrLn $ show $ last $ sort $ filter isPalindrome products

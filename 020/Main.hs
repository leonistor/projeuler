module Main where

import Data.Char (digitToInt)

sumDigits :: Integer -> Int
sumDigits n = sum $ map digitToInt $ show n

main :: IO ()
main = print $ show $ sumDigits $ product [1..100]

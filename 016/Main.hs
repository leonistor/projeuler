module Main where

import Data.Char

sumDigits :: String -> Int
sumDigits = sum . map digitToInt

-- avoid "Defaulting the following constraints to type ‘Integer’"
target :: Integer
target = (2 :: Integer) ^ (1000 :: Integer)

main :: IO ()
main = print $ sumDigits $ show target

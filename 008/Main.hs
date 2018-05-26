module Main where

import TheNumber
import Data.List

main :: IO ()
main = do
  putStrLn $ show $ largestProduct 13 bigNum

largestProduct :: Int -> String -> Integer
largestProduct n num = maximum $ map digitsProduct (windows n num)

-- https://stackoverflow.com/a/27730051/9727366

windows' :: Int -> [a] -> [[a]]
windows' n = map (take n) . tails
-- windows' 3 [1..5] --> [[1,2,3],[2,3,4],[3,4,5],[4,5],[5],[]]

-- using one list as a ruler to measure the amount to take from another
takeLengthOf :: [a] -> [b] -> [b]
takeLengthOf = zipWith (flip const)
-- takeLengthOf ["elements", "get", "ignored"] [1..10] --> [1,2,3]

windows :: Int -> [a] -> [[a]]
windows n xs = takeLengthOf (drop (n-1) xs) (windows' n xs)
-- windows 3 [1..5] --> [[1,2,3],[2,3,4],[3,4,5]]
-- take 5 (windows 3 [1..]) --> [[1,2,3],[2,3,4],[3,4,5],[4,5,6],[5,6,7]]

-- product of digits from string
digitsProduct :: String -> Integer
digitsProduct str =
  product (map (\d -> read [d] :: Integer) str)

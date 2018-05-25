module Main where

main :: IO ()
main = do
  putStrLn $ show (difference 100)

difference :: Integer -> Integer
difference n =
  squareOfSums - sumOfSquares
  where
    squareOfSums = (n * (n + 1) `div` two)^two
    sumOfSquares = sum [x^two | x<-[1..n]]
    two = 2 :: Integer

module Main where
-- https://wiki.haskell.org/Euler_problems/11_to_20
import Data.List (maximumBy)
import Data.Ord (comparing)
import Data.Array

main :: IO ()
main = print . maximumBy (comparing snd) . assocs . syrs $ 1000000


chain :: Integer -> [Integer]
chain 1 = [1]
chain n
  | even n = n:chain (n `div` 2)
  | odd  n = n:chain (3*n + 1)

syrs :: Integer -> Array Integer Integer
syrs n =
  a
  where
    a = listArray (1,n) $ 0 : map syr [2..n]
    syr x =
      if y <= n then 1 + a!y else 1 + syr y
      where
        y = if even x then x `div` 2 else 3 * x + 1

module Main where

{-

central binomial coefficients
(2n)! / n!^2

simplified:
(n+1)*(n+2)*...*(2n-1) / 3*4*...*(n-1)

-}
cbf, cbf' :: Integer -> Integer
cbf n
    | n < 10    = fact (2*n) `div` (fact n * fact n)
    | otherwise = cbf' n
    where fact x = product [1..x]

cbf' n = let a = product [(n+1) .. (2*n - 1)]
             b = product [3..(n-1)]
         in  a `div` b

main :: IO ()
main = print $ cbf 20

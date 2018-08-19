#!/usr/bin/env stack
{- stack
    --resolver lts-12.4
    --install-ghc
    runghc
    --package containers
-}

{- https://wiki.haskell.org/Euler_problems/21_to_30 -}

--http://www.research.att.com/~njas/sequences/A048242

import Data.Array 

maxN :: Int
maxN = 28124

abundant :: Int -> Bool
abundant n = totient n - n > n

abundsArray :: Array Int Bool
abundsArray = listArray (1,maxN) $ map abundant [1..maxN]

abunds :: [Int]
abunds = filter (abundsArray !) [1..maxN]
 
rests :: Int -> [Int]
rests x = map (x-) $ takeWhile (<= x `div` 2) abunds

isSum :: Int -> Bool
isSum = any (abundsArray !) . rests

totient :: Int -> Int
totient 1 = 1
totient a = length $ filter (coprime a) [1..a-1]
    where coprime u v = gcd u v == 1

main :: IO ()
main = print . sum . filter (not . isSum) $ [1..maxN]

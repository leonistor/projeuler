module Main where

-- 021
divisors :: Integral a => a -> [a]
divisors 1 = [1]
divisors n = if isSquare n then 1 : init divisors' else 1 : divisors'
        where 
            divisors' = concat [ [x, n `div` x] | x <- [2..limit], n `rem` x == 0 ]
            limit = (floor . (sqrt :: Double -> Double) . fromIntegral) n
            isSquare :: Integral a => a -> Bool
            isSquare = (==) (sq * sq)
                where sq = floor $ sqrt (fromIntegral n::Double)

sumDivisors :: Int -> Int
sumDivisors = sum . divisors

maxNum :: Int
maxNum = 28123

{- 266.66s !!! -}
main :: IO ()
main = print ans

{- https://github.com/nayuki/Project-Euler-solutions/blob/master/haskell/p023.hs -}

ans :: Int
ans = sum (filter (not . isSumOfTwoAbundants) [1..maxNum])

isSumOfTwoAbundants :: Int -> Bool
isSumOfTwoAbundants n = any (\k -> isAbundant (n - k)) (takeWhile (< n) abundants)
abundants :: [Int]
abundants = filter isAbundant [1..]
isAbundant :: Int -> Bool
isAbundant n = sumDivisors n > n


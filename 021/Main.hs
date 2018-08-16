module Main where

-- https://stackoverflow.com/a/11984461/9727366
divisors :: Integral a => a -> [a]
divisors n = if isSquare n then 1 : init divisors' else 1 : divisors'
        where 
            divisors' = concat [ [x, n `div` x] | x <- [2..limit], n `rem` x == 0 ]
            limit = (floor . (sqrt :: Double -> Double) . fromIntegral) n

sumDivisors :: Integer -> Integer
sumDivisors = sum . divisors

-- https://stackoverflow.com/a/2807870/9727366
isSquare :: Integral a => a -> Bool
isSquare n = sq * sq == n
    where sq = floor $ sqrt (fromIntegral n::Double)

candidates :: Integer -> [(Integer, Integer)]
candidates m = [ (x,sdx) | x <- [2..m], let sdx = sumDivisors x, sdx /= 1, x /= sdx, sdx <= m ]

removeDups :: [(Integer,Integer)] -> [(Integer,Integer)]
removeDups [] = []
removeDups (t:ts) = if swap t `elem` ts then t : removeDups ts else removeDups ts

-- Data.Tuple (swap)
-- | Swap the components of a pair.
swap :: (a,b) -> (b,a)
swap (a,b) = (b,a)

main :: IO ()
main = print $ sum $ map (uncurry (+)) $ removeDups $ candidates 10000

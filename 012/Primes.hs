module Primes(
           primes
          ,primeFactors
          ) where
--
{- 
  https://wiki.haskell.org/Prime_numbers_miscellaneous#Prime_Wheels
-}

primes :: [Integer]

-- with a wheel
primes = [2,3,5,7] ++ _Y ( (11:)                                      
                            . minus (scanl (+) 13 $ tail wh11)   
                              . unionAll                         
                              . map (\p-> map (p*) . dropWhile (< p) $ 
                                              scanl (+) (p - rem (p-11) 210) wh11) )
--

primeFactors :: Integer -> [Integer]
primeFactors n = factor n primes
  where 
    factor x (p:ps)
      | p*p > x        = [x]
      | x `mod` p == 0 = p : factor (x `div` p) (p:ps)
      | otherwise      =     factor x ps


-- ordered lists, difference and union
minus :: Ord a => [a] -> [a] -> [a]
minus (x:xs) (y:ys) = case (compare x y) of 
           LT -> x : minus  xs  (y:ys)
           EQ ->     minus  xs     ys 
           GT ->     minus (x:xs)  ys
minus  xs     _     = xs

union :: Ord a =>  [a] -> [a] -> [a]
union (x:xs) (y:ys) = case (compare x y) of 
           LT -> x : union  xs  (y:ys)
           EQ -> x : union  xs     ys 
           GT -> y : union (x:xs)  ys
union  xs     []    = xs
union  []     ys    = ys

unionAll :: [[Integer]] -> [Integer]
unionAll = foldi (\(x:xs) ys-> x:union xs ys) []
 
foldi            :: (a -> a -> a) -> a -> [a] -> a
foldi _f z []    = z
foldi f z (x:xs) = f x (foldi f z (pairs f xs))
 
pairs            :: (a -> a -> a) -> [a] -> [a]
pairs f (x:y:t)  = f x y : pairs f t
pairs _f t       = t

_Y :: (t -> t) -> t
_Y g = g (_Y g)

wh11 :: [Integer]
wh11 = 2:4:2:4:6:2:6:4:2:4:6:6:2:6:4:2:6:4:6:8:4:2:4:2:         -- 210-wheel,
       4:8:6:4:6:2:4:6:2:6:6:4:2:4:6:2:6:4:2:4:2:10:2:10:wh11   --   from 11
  -- cycle $ zipWith (-) =<< tail $ [i | i <- [11..221], gcd i 210 == 1]

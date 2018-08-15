module Main where


ones, teens, tens, thousand :: [String]
ones  = ["","one","two","three","four","five","six","seven","eight","nine"]
teens = ["ten","eleven","twelve","thirteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"]
tens  = ["","","twenty","thirty","forty","fifty","sixty","seventy","eighty","ninety"]
thousand = ["onethousand"]

splitToDigits :: Int -> (Int, Int, Int)
splitToDigits n 
    | n >= 1 && n < 1000 = (n3,n2,n1)
    | otherwise          = (0,0,0)
    where
        n1 = n `mod` 10
        n2 = (n - n3 * 100) `div` 10
        n3 = n `div` 100

numToWords :: Int -> String
numToWords n
    | n >= 1   && n <=  9    = ones!!f1
    | n >= 10  && n <= 19    = teens!!f1
    | n >= 20  && n <= 99    = (tens!!f10) ++ (ones!!f1)
    | n >= 100 && 
        f10 == 0 && 
        f1  == 0 &&
        n <= 999             = (ones!!f100) ++ "hundred"
    | n > 100 && n <= 999    = (ones!!f100) ++ "hundredand" ++ numToWords (n - 100 * f100)
    | n == 1000              = head thousand
    | otherwise              = "*"
    where
        (f100,f10,f1) = splitToDigits n

main :: IO ()
main = print $ sum $ map (length . numToWords) [1..1000]

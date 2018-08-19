module Main where

import Data.Char (ord)
import Data.List (sort)

charScore :: Char -> Int
charScore c
    | c `elem` ['A'..'Z'] = ord c - 64
    | otherwise           = 0

nameScore :: String -> Int
nameScore = sum . map charScore    

listScore :: [String] -> Int
listScore names = sum $ zipWith (\i name -> i * nameScore name) [1..] (sort names)

parseList :: String -> [String]
parseList = words . map commaToSpace . filter ('"' /=)
    where commaToSpace c = if c == ',' then ' ' else c

main :: IO ()
main = do
    names <- readFile "./names.txt"
    let totalScore = listScore (parseList names)
    print totalScore

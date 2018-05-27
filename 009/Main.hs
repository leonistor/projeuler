module Main where

import Data.List
import Data.Maybe

main :: IO ()
main = do
  let (x,y,z) = fromJust $ find (\(a,b,c) -> a + b + c == 1000) rightTriangles
  putStrLn $ show (x * y * z)

rightTriangles :: [(Integer, Integer, Integer)]
rightTriangles = [ (a,b,c) | c<-[1..], b<-[1..c], a<-[1..b], a*a + b*b == c*c]



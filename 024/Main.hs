module Main where

import Data.List

lexiPerms :: [String]
lexiPerms = sort $ permutations ['0'..'9']

answer :: String
answer = lexiPerms!!999999

main :: IO ()
main = print answer

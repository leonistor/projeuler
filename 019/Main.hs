module Main where

import Data.Time.Calendar (Day(..), fromGregorian, toGregorian)
import Data.Time.Calendar.WeekDate (toWeekDate)

firstDay, lastDay :: Day
firstDay = fromGregorian 1901 1  1
lastDay  = fromGregorian 2000 12 31

sundaysFirst :: [Day]
sundaysFirst = filter (\d -> 
                let 
                    (_,_,wday) = toWeekDate d
                    (_,_,mday) = toGregorian d
                in wday == 7 && mday == 1
                ) [firstDay..lastDay]

main :: IO ()
main = print $ length sundaysFirst

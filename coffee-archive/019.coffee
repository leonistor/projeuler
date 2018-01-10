###
Problem 19
Counting Sundays

You are given the following information, but you may prefer to do some research for yourself.

    1 Jan 1900 was a Monday.
    Thirty days has September,
    April, June and November.
    All the rest have thirty-one,
    Saving February alone,
    Which has twenty-eight, rain or shine.
    And on leap years, twenty-nine.
    A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
###

print = require('util').print
println = (args) -> print args+"\n"

daysInMonth = (month, year) ->
  switch month
    when 2 
      # Un an este bisect daca este divizibil cu 4, exceptand cazurile cand este divizibil cu 100 fara a fi divizibil cu 400
      if (year % 4 is 0) and not ( (year % 100 is 0) and (year % 400 isnt 0)  ) 
        return 29
      else return 28
    when 9, 4, 6, 11 then return 30
    else
      return 31
###
# Teste pentru daysInMonth
println "ani bisecti obisnuiti: 1872, 1912, 1960, 1996, 2008..."
println daysInMonth(2, 1872)
println daysInMonth(2, 1912)
println daysInMonth(2, 1960)
println daysInMonth(2, 1996)
println daysInMonth(2, 2008)
println "ani ne-bisecti"
println daysInMonth(2, 1913)
println daysInMonth(2, 1915)
println "exceptii de la regula de baza(nu sunt bisecti): 1800, 1900, 2100, 2200..."
println daysInMonth(2, 1800)
println daysInMonth(2, 1900)
println daysInMonth(2, 2100)
println daysInMonth(2, 2200)
println "sunt totusi ani bisecti: 2000, 2400, 2800 ..."
println daysInMonth(2, 2000)
println daysInMonth(2, 2400)
println daysInMonth(2, 2800)
###

weekdays = ["Du", "Lu", "Ma", "Mi", "Jo", "Vi", "Sa"]

# 1 Jan 1900 was a Monday
cand = 1
# sunday first of month
sfm = 0

for year in [1900..2000]
  println year + ":::::"
  for month in [1..12]
    println month + ":" 
    for day in [1..daysInMonth(month, year)]
      if cand % 7 is 0 and day is 1 and year isnt 1900
        sfm++
      print day + "-" + weekdays[(cand % 7)] + " "
      cand++
    println ""
  println ""

println "We have #{sfm} sundays on 1st of month"
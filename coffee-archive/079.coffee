###
Problem 79
Passcode derivation

A common security method used for online banking is to ask the user
for three random characters from a passcode. For example, if the
passcode was 531278, they may ask for the 2nd, 3rd, and 5th
characters; the expected reply would be: 317.

The text file, keylog.txt, contains fifty successful login attempts.

Given that the three characters are always asked for in order, analyse
the file so as to determine the shortest possible secret passcode of
unknown length.
###

require './data/keylog.js'
_ = require './utils/underscore-min'
 
k = _.uniq(keylog)#.slice(0,5)

# console.log k
for l in k
  l = l.toString()
  console.log l[0] + ' ' + l[1]
  console.log l[0] + ' ' + l[2]
  console.log l[1] + ' ' + l[2]

###
ruleaza cu coffee 079.coffee | tsort
si obtii rezultatul

vezi
http://en.wikipedia.org/wiki/Topological_sorting


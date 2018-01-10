###
Problem 59
XOR decryption

Each character on a computer is assigned a unique code and the
preferred standard is ASCII (American Standard Code for Information
Interchange). For example, uppercase A = 65, asterisk (*) = 42, and
lowercase k = 107.

A modern encryption method is to take a text file, convert the bytes
to ASCII, then XOR each byte with a given value, taken from a secret
key. The advantage with the XOR function is that using the same
encryption key on the cipher text, restores the plain text; for
example, 65 XOR 42 = 107, then 107 XOR 42 = 65.

For unbreakable encryption, the key is the same length as the plain
text message, and the key is made up of random bytes. The user would
keep the encrypted message and the encryption key in different
locations, and without both "halves", it is impossible to decrypt the
message.

Unfortunately, this method is impractical for most users, so the
modified method is to use a password as a key. If the password is
shorter than the message, which is likely, the key is repeated
cyclically throughout the message. The balance for this method is
using a sufficiently long password key for security, but short enough
to be memorable.

Your task has been made easy, as the encryption key consists of three
lower case characters. Using cipher1.txt (right click and 'Save
Link/Target As...'), a file containing the encrypted ASCII codes, and
the knowledge that the plain text must contain common English words,
decrypt the message and find the sum of the ASCII values in the
original text.
###

_ = require './utils/underscore-min'

cipher     = require('./data/cipher1.js').cipher
english100 = require('./data/english100.js').english100

# text to ASCII codes array
toCodes = (text) ->
  _.map( text, (c) -> c.charCodeAt(0) )

# ASCII codes array to text
toText = (a) ->
  _.map( a, (e) -> String.fromCharCode(e) ).join('')

# cyclic xor text with 3-char key 
encrypt = (text, key) ->
  rest   = text.length % 3
  groups = (text.length - rest) / 3
  # console.log text.length, groups, rest
  s = []
  for g in [0..groups-1]
    for c, i in text[3*g..3*g+2]
      # s.push key[i]
      s.push c ^ key[i]
  if rest is 1
    # console.log groups, text[3*groups]
    s.push text[3*groups] ^ key[0]
  if rest is 2
    # console.log groups, text[3*groups] 
    # console.log groups, text[3*groups+1] 
    s.push text[3*groups]   ^ key[0]
    s.push text[3*groups+1] ^ key[1]
  s
# end encrypt

# test
# key = [106,111,115]
# x = 'Tata lui Stefan cel Mare'
x = """
The file, poker.txt, contains one-thousand random hands dealt to two
players. Each line of the file contains ten cards (separated by a
single space): the first five are Player 1's cards and the last five
are Player 2's cards. You can assume that all hands are valid (no
invalid characters or repeated cards), each player's hand is in no
specific order, and in each hand there is a clear winner.

down
side
been 
now
"""

# x = toCodes(x)
# console.log x
# console.log toText(x)
# y = encrypt(x, key)
# console.log y
# z = encrypt(y, key)
# console.log z
# console.log toText(z)

# word of length min 3 for testing decrypt text
# enWords = _.filter( english100, (word) -> word.length > 2 )
# console.log enWords

# how many of the 100 most common english word are present in the text  
hasWords = (text) ->
  text = text.toLowerCase()
  count = 0
  _.map( english100, (word) -> 
      if text.indexOf(word) >= 0
        return count++
    )
  count
# end hasWords
# console.log hasWords(x)
# console.log x.indexOf('been')

# check if text (as ASCII codes array) contains only printable chars
# http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters
isReadable = (a) ->
  # get rid of tab, LF, CR
  b = _.without(a, 9, 10, 13)
  min = _.min(b)
  max = _.max(b)
  # console.log min, max
  32 <= min <= max <= 126

# key chars range
LOWERCASE = ['a'.charCodeAt(0)..'z'.charCodeAt(0)]


# using just 100 chars to test the possible keys
test = cipher[0...3*100]
count = 0
for a in LOWERCASE
  for b in LOWERCASE
    for c in LOWERCASE
      key = [a, b, c]
      cand = encrypt test, key
      if isReadable(cand)
        if hasWords( toText(cand) ) > 20
          console.log "GOT TEXT!"
          console.log toText(cand)
          theKey = key

decipher = encrypt cipher, theKey
console.log "------------ The text is ------------------"
console.log toText(decipher)
console.log "------------     ***     ------------------"

sum = 0
_.map( decipher, (c) -> sum += c )
console.log "The ASCII sum is #{sum}"


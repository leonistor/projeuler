/*
  Largest prime factor
  Problem 3

  The prime factors of 13195 are 5, 7, 13 and 29.
  What is the largest prime factor of the number 600851475143 ?
 */

package main

import 
  ("fmt"
    "strconv"
    "os"
    )

const myNumber = 600851475143
const step = 100000
// print dot or step
func printStep(i int64) {
  if i % (step*10) == 0 { fmt.Println(i) }
  if i % step == 0 { fmt.Printf(".") }
}

// divide number by factor, return the pow of factor in number factorization, and the reminder
func factorWith(number, factor int64) (reminder, power int64) {
  reminder = number
  for reminder % factor == 0 {
    power += 1
    reminder = reminder / factor
  }
  return
}


func main() {
  
  var n, factor, x, p, i int64

  // convert input to number base 10, int64
  n, err := strconv.ParseInt(os.Args[1], 10, 64)
  if err != nil {
    n = myNumber
  }

  x = n // keep n for reference

  x, p = factorWith(x, 2)
  if p!=0 { factor = 2 }
  x, p = factorWith(x, 3)
  if p!=0 { factor = 3 }

  i = 1
  for 6 * i + 1 <= n {
    printStep(i)
    x, p = factorWith(x, 6 * i - 1)
    if p!=0 { factor = 6 * i - 1 }

    x, p = factorWith(x, 6 * i + 1)
    if p!=0 { factor = 6 * i + 1 }
    i++
  }


  // 7879*7879*7879*17 = 8314999411463

  fmt.Printf("Largest prime factor of %d is %d\n", n, factor)
}


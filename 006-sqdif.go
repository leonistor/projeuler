/*

Problem 6
Sum square difference

The sum of the squares of the first ten natural numbers is,
1^2 + 2^2 + ... + 10^2 = 385

The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)^2 = 55^2 = 3025

Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
*/

package main

import (
  "fmt"
)

func main() {
  
  var s, ss int

  for i:=1; i<=100; i++ {
    ss += i*i
    s += i
  }

  fmt.Printf("Sum of squares %d - square of sum %d is %d", ss, s*s, ss - s*s)
}
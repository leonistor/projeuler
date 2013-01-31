/*

Problem 5
Smallest multiple

2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible (divisible with no remainder) by all of the numbers from 1 to 20?

 */

package main

import (
  "fmt"
)

func main() {

  fmt.Printf("Result: %d\n", 2*2*2*2 * 3*3 * 5 * 7 * 11 * 13 * 17 * 19 )

}
/*

Problem 4
Largest palindrome product

A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
Find the largest palindrome made from the product of two 3-digit numbers.


 */

package main

import (
  "fmt"
  "strconv"
)

func isPalindrome(n int) bool {
  s := strconv.Itoa(n)
  // fmt.Println("len de ", s, " este ", len(s))
  for i, j := 0, len(s)-1; i < j; i, j = i+1, j-1 {
    // fmt.Println("i: ", i, " j: ", j, " s[i]: ", s[i], " s[j]: ", s[j])
    if s[i] != s[j] { return false }
  }
  return true
}


func main() {

// ha!
// 698896 is palindrome product of  836 * 836
// 906609 is palindrome product: 993*913

  var rezultatAfisat = "%d is palindrome product: %d*%d\n"
  var largest, a, b = 1, 1, 1

  for i := 999; i >= 100; i-- {
    // if isPalindrome( i * i ) { fmt.Printf(rezultatAfisat, i*i, i, i) }
    // if isPalindrome( i * (i-1) ) { fmt.Printf(rezultatAfisat, i*(i-1), i, i-1) }

    for j:=0; j<998; j++ {
      if isPalindrome(i*j) {
        if largest < i*j {
          largest, a, b = i*j, i, j
        }
      }
    }
  }

  fmt.Printf(rezultatAfisat, largest, a, b)
  
}
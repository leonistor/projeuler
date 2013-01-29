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
    "os")

const myNumber = 600851475143

func main() {
  // convert input to number base 10, int64
  var n, factor, x, result int64
  n, err := strconv.ParseInt(os.Args[1], 10, 64)
  if err != nil {
    n = myNumber
  }

  // de la http://jonlandrum.com/2012/09/10/calculating-the-largest-prime-factor-of-a-number/

  x = n
  factor = 2 // the first prime


  if isPrime(n) {
    result = n
  } else {

    for {

      // Determine if the user input is divisible by factor
      if x % factor == 0 {
        // If so, repeatedly divide the user input by factor until it is not evenly divisible anymore.
        x = x / factor
        for x % factor == 0 {
          x = x / factor
        }
        result = factor
      }

      // Iterate factor to the next prime, and start checking if the remainder is divisible again
      for {
        factor += 1
        if factor % 1000000 == 0 { fmt.Printf(".") }
        if factor % 1000000000 == 0 { fmt.Println(factor) }
        if isPrime(factor) { break; }
      }

      // Continue like so until the user input is equal to the final value of factor
      if factor >= n { break; }

    }

  } // end else isPrime

  fmt.Printf("Largest prime factor of %d is %d\n", n, result)
}

// check wether the number received is prime
// from http://jonlandrum.com/2012/02/06/computing-the-nth-prime/
func isPrime(n int64) bool {
  
  var result = false
  var i int64

  if n <= 1 {
	 result = false  // 1 is not prime
  } else if (n == 2) || (n == 3) {
	 result = true // 2 and 3 hard-coded
  } else if (n % 2) == 0 {
	 result = false // get rid of evens
  } else {
  	// now we check to see if n is divisible by the odd numbers from 3 on.
  	i = 3
  	result = true // assume it's prime, the prove

  	for {
  	  // If i^2 is not a root of n, or if n % i == 0. (Won't be larger than the square.)
  	  if (i * i > n) || (n % i == 0) {
  		  break
  	  }
  	  i += 2; // Iterate by 2 to get odds
  	}

    if i * i > n {
      result = true
    } else {
      result = false
    }

  }
  return result
}

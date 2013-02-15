/*

	Problem 10
	Summation of primes

	The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
	Find the sum of all the primes below two million.

*/

package main

import (
	"fmt"
	"github.com/leonistor/projeuler/utils"
)

const maxValue = 2000000

func main() {
	var sum int64 // ah! if only int it's cycling :-(
	sum = 17      // 2 + 3 + 5 + 7 are the primes below 10

	// we start at 11, the first prime after 10
	for i := int64(11); i <= maxValue; i++ {
		// simple ugly optimization
		if (i%2 != 0) && (i%3 != 0) && (i%5 != 0) {
			if utils.IsPrime(int64(i)) {
				sum += i
				fmt.Println("Found prime ", i, " sum is ", sum)
			}
		}
	}
	fmt.Println("The sum is: ", sum)
}

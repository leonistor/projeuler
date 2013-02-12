/*

	Problem 7
	1001 Prime

	By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
	What is the 10001st prime number?

*/

package main

import (
	"fmt"
	"github.com/leonistor/projeuler/utils"
)

const indexOfPrime = 10001 // al catelea prim vrem

func main() {
	var n, count int64

	fmt.Printf("Looking for the %dth prime...\n", indexOfPrime)

	count = 6
	n = 13
	for count <= indexOfPrime {
		if utils.IsPrime(n) {
			fmt.Printf("%d is the %dth prime\n", n, count)
			count++
		}
		n++
	}
}

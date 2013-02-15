/*

	Problem 9
	Special Pythagorean triplet

	A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
	a^2 + b^2 = c^2

	For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

	There exists exactly one Pythagorean triplet for which a + b + c = 1000.
	Find the product abc.


*/

package main

import (
	"fmt"
	"sort"
)

const sum = 1000

func main() {
	for a := 1; a < sum; a++ {
		for b := 1; b <= sum-a; b++ {
			c := sum - a - b
			s := []int{a, b, c}
			sort.Ints(s)
			if s[2]*s[2] == s[1]*s[1]+s[0]*s[0] {
				fmt.Println("Pythagorean numbers found: ", a, b, c, ", sum: ", a+b+c, " prod: ", a*b*c)
			}
		}
	}
}

// Utilities functions for project euler
package utils

import (
	"math"
)

// divide number by factor, return the pow of factor in number factorization, and the reminder
func FactorWith(number, factor int64) (reminder, power int64) {
	reminder = number
	for reminder%factor == 0 {
		power += 1
		reminder = reminder / factor
	}
	return
}

// check if num is prime
func IsPrime(num int64) bool {
	var i int64

	if (num%2 == 0) || (num%3 == 0) || (num%5 == 0) {
		return false
	}
	i = 1
	for float64(6*i-1) <= math.Sqrt(float64(num)) {
		if (num%(6*i+1) == 0) || (num%(6*i-1) == 0) {
			return false
		}
		i++
	}
	return true
}

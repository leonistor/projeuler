// Utilities functions for project euler
package utils

import (
	"strconv"
)

// chooses the min from a list of integers
func Min(a ...int) int {
	min := a[0]
	for _, val := range a {
		if val < min {
			min = val
		}
	}
	return min
}

// chooses the max from a list of integers
func Max(a ...int) int {
	max := a[0]
	for _, val := range a {
		if val > max {
			max = val
		}
	}
	return max
}

// print number under 100 using two characters
func PrintDoubleDigit(i int) string {
	if i < 10 {
		return " " + strconv.Itoa(i)
	} else if i < 100 {
		return strconv.Itoa(i)
	}
	return "XX"
}

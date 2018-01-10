// Problem 2

// Each new term in the Fibonacci sequence is generated by adding the previous two terms.
// By starting with 1 and 2, the first 10 terms will be:
// 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
// By considering the terms in the Fibonacci sequence whose values do not exceed four million,
// find the sum of the even-valued terms.

package main

import "fmt"

const maxVal = 4000000

func fibonacci() func() int {
	a, b := 0, 1
	return func() int {
		defer func() {
			a, b = b, a+b
		}()
		return a
	}
}

func sumEven() int {
	f := fibonacci()
	sum := 0

	for num := f(); num < maxVal; num = f() {
		// fmt.Println("number", num)
		if num%2 == 0 {
			sum += num
		}
	}
	return sum
}

func main() {

	fmt.Println("The sum is", sumEven())
}

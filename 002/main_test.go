package main

import "testing"

func TestFibonacci(t *testing.T) {
	firstTenFibonacci := []int{0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144}
	f := fibonacci()
	for i := 0; i < len(firstTenFibonacci); i++ {
		num := f()
		if num != firstTenFibonacci[i] {
			t.Error(num, "should be ", firstTenFibonacci[i])
		}
	}

}

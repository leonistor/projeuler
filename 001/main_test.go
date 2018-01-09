package main

import "testing"

const sumMultiples1000 = 233168

func TestSumMultiples(t *testing.T) {
	sum := sumMultiples(1000)
	if sum != sumMultiples1000 {
		t.Error("Error, got", sum, "expected", sumMultiples1000)
	}
}

/*

Problem 14
Longest Collatz sequence



The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:
13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. 
Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.


*/

package main

import (
	"fmt"
)

const stopNum uint64 = 1000000 // one million
var theNumber, theSteps uint64
var stepMap map[uint64]uint64 // a map with the number of Collatz steps for each number

func main() {

	stepMap = make(map[uint64]uint64) // Maps must be created with make (not new) before use

	stepMap[1] = 3
	stepMap[2] = 1
	stepMap[3] = 7
	stepMap[4] = 2
	stepMap[5] = 5
	stepMap[6] = 8

	var i, steps, n uint64
	for i = 7; i < stopNum; i++ {

		steps = 0
		n = i
		found := false
		// fmt.Println("--- pentru ", i)

		for n != 1 && !found {
			n = nextCollatz(n)
			// fmt.Print(n, ">")
			steps++
			if v, ok := stepMap[n]; ok {
				steps = steps + v
				found = true
				// fmt.Print("stop at", n, "it has", v)
			}
		}
		stepMap[i] = steps

		if steps >= theSteps {
			theSteps = steps
			theNumber = i
			fmt.Println(i, "has", steps, "steps -------------------")
		}
		if i == 837799 {
			fmt.Println(i, "has", steps, "steps ***********")
		}
	}

	// print final result
	fmt.Println("FINALLY: ", theSteps, "steps for", theNumber)
}

func nextCollatz(n uint64) uint64 {
	if n > 1 {
		if n%2 == 0 {
			return n / 2
		} else {
			return 3*n + 1
		}
	} else {
		return 1
	}
	return 1
}

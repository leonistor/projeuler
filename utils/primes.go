// Utilities functions for project euler
package utils

// divide number by factor, return the pow of factor in number factorization, and the reminder
func FactorWith(number, factor int64) (reminder, power int64) {
	reminder = number
	for reminder%factor == 0 {
		power += 1
		reminder = reminder / factor
	}
	return
}

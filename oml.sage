# Program: oml.sage
# Purpose: gives the inverse of an element under the formal group law
# Author: Anh Huynh
# Created: 6/03/13
# Latest version: 6/03/13

def om(y):
	if (law == "additive"):
		return -y
	if (law == "multiplicative"):
		return y/( y - 1 )
		# K_theory
	if (law == "tangent"):
		return -y
		# tangent law

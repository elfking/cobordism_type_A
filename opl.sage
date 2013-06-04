# Program: opl.sage
# Purpose: gives the formal group law
# Author: Anh Huynh
# Created: 6/03/13
# Latest version: 6/03/13

def op(x, y):
	if (law == "additive"):
		return x + y
		# cohomology
	if (law == "multiplicative"):
		return x + y - x*y 
		# K-theory
	if (law == "tangent"):
		return (x + y)/(1 - x*y)	
		# tangent law
	else:
		print "Please define the formal group law in moment_graphs_type_A.sage"
		return 0


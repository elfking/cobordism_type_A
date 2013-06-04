# Program: y_subs.sage
# Purpose: substitute y[i] for x[i]
# Author: Anh Huynh
# Created: 6/03/13
# Latest version: 6/03/13

def y_subs(expr):
	for i in range(m+1):
		expr = expr.subs({x[i]:y[i]})
	return expr

# Program: y_simple_transposition.sage
# Purpose: swap y[i] and y[i+1]
# Author: Anh Huynh
# Created: 6/03/13
# Latest version: 6/03/13

def y_simple_transposition(i,expr):
	f = expr.subs({y[i-1]:temp})
	# because y[i-1] = y_i
	g = f.subs({y[i]:y[i-1]})
	h = g.subs({temp:y[i]})
	return h

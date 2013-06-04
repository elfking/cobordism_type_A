# Program: x_simple_transposition.sage
# Purpose: swap x[i] and x[i+1]
# Author: Anh Huynh
# Created: 6/03/13
# Latest version: 6/03/13

def x_simple_transposition(i,expr):
	# swap xi and xi+1
	f = expr.subs({x[i-1]:temp})
	g = f.subs({x[i]:x[i-1]})
	h = g.subs({temp:x[i]})
	return h

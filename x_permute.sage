# Program: x_permute.sage
# Purpose: permute the xvar
# Author: Anh Huynh
# Created: 6/03/13
# Latest version: 6/03/13

def x_permute(perm,expr):
	for i in reversed(perm.reduced_word()): # apply s_i from right to left
		expr = x_simple_transposition(i,expr)
	return expr


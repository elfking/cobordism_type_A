# Program: y_permute.sage
# Purpose: permute the yvars
# Author: Anh Huynh
# Created: 6/03/13
# Latest version: 6/03/13

def y_permute(perm,expr):
	for i in reversed(perm.reduced_word()): #apply s_i from right to left
		expr = y_simple_transposition(i,expr)
	return expr


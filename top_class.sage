# Program: top_class.sage
# Purpose: define moment graphs of [Z_id]
# Author: Anh Huynh
# Date: 6/03/13
# Latest version: 6/03/13

def top_class(m):
	top_poly = 1
	for i in range(m):
		for j in range(m-i):
			top_poly *= op(x[i],om(y[j]))
	Z_id = expr_to_moment_graph(WeylGroup(["A",m]),top_poly)
	return Z_id

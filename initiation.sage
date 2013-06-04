# Program: initiation.sage
# Purpose: Set up the Weyl group and the ring of polynomials
# Author: Anh Huynh
# Created: 6/03/13
# Latest version: 6/03/13

def initiation(m):
	n = m+1

	# m is the rank of the group Am, n is the number of variables.
	# The ring of polynomial is P_n = ZZ[x1,...,xn]
	# W: the Weyl group S_n
	# s[i]: the simple transposition swapping xi, xi+1
	# w0: the long elemetn of W
	# e: the unit element of W
	# bi: the entire Bruhat interval
	W 	= WeylGroup(["A",m],prefix="s")
	s 	= W.simple_reflections()
	w0	= W.long_element()
	e	= W.unit()

	bi	= W.bruhat_interval(e,w0)
	# Other commands:
	# bg=W.bruhat_graph(e,w0)
	# bg.show3d()
	# W.reflections()
	# Define the variables
	# x[i] = x_{i+1}
	# y[i] = y_{i+1}
	x = []
	y = []
	for i in range(1,n+1):
		x.append('x' + str(i))
		y.append('y' + str(i))
	for i in range(len(x)):
		x[i] = var(x[i])
		y[i] = var(y[i])

	temp = var('temp')
	return [W, s, w0, e, bi, x, y, temp]

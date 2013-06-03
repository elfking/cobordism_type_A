# Program: Chassis
# Purpose: define moment graphs in type A, given explicit group law
# Author: Anh Huynh
# Date: 06/3/13
# Latest version: /13

# Contains:
# def reduced_word_to_element(reduced_word)
# def y_subs(expr)
# def x_simple_transposition(i,expr)
# def y_simple_transposition(i,expr)
# def x_permute(perm,expr)
# def y_permute(perm,expr)
# class Node
# class Moment_graph
# def expr_to_moment_graph(Weyl_group,expression)
# def Delta(i, moment_graph)
# def add_moment_graphs(moment_graph1,moment_graph2)
# def multiply_moment_traphs(moment_graph1,moment_graph2)

#-----------------------------------------
# Part I: Import libraries and declaration
#-----------------------------------------

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

def om(y):
	if (law == "additive"):
		return -y
	if (law == "multiplicative"):
		return y/( y - 1 )
		# K_theory
	if (law == "tangent"):
		return -y
		# tangent law

#-------------------------------------------------------------
# Part II: define the moment graph class and related functions
#-------------------------------------------------------------

def reduced_word_to_element(reduced_word):
	w = e
	for i in reduced_word:
		w = w*s[i]
	return w

def y_subs(expr):
	# substitute x[i]=y[i]
	for i in range(n):
		expr = expr.subs({x[i]:y[i]})
	return expr

def x_simple_transposition(i,expr):
	# swap xi and xi+1
	f = expr.subs({x[i-1]:temp})
	g = f.subs({x[i]:x[i-1]})
	h = g.subs({temp:x[i]})
	return h

def y_simple_transposition(i,expr):
	#swap yi and yi+1
	f = expr.subs({y[i-1]:temp})
	# because y[i-1] = y_i
	g = f.subs({y[i]:y[i-1]})
	h = g.subs({temp:y[i]})
	return h

def x_permute(perm,expr):
	for i in reversed(perm.reduced_word()): # apply s_i from right to left
		expr = x_simple_transposition(i,expr)
	return expr

def y_permute(perm,expr):
	for i in reversed(perm.reduced_word()): #apply s_i from right to left
		expr = y_simple_transposition(i,expr)
	return expr

class Node:
# Node stands for a node in the moment graph.
# It has the expression attached to it,
# It has its name: the permutation associated with it
# It has a list of its parents and a list of its children.
# But maybe those nodes have not been created. How about just
# storing the permutation of these nodes?

	def __init__(self,perm,expr):
		self.value 	= expr
		self.id 	= reduced_word_to_element(perm.reduced_word())
		# self.parents	= []
		# self.children	= []
		# for i in range(n):
			# if ( (self.id*s[i]).length() > (self.id.length()) ):
				# self.children	+= [self.id*s[i]]
			# else:
				# self.parents 	+= [self.id*s[i]]
		# self.adjacents 	= self.parents + self.children

class Moment_graph:
	def __init__(self, Weyl_group):
		self.W 		= Weyl_group
		# hash perm -> node
		self.nodes 	= dict()
		for perm in self.W.bruhat_interval(self.W.unit(),self.W.long_element()):
			self.nodes.update( {perm:Node(perm, 0)})

def expr_to_moment_graph(Weylgroup,expr):
	new_graph = Moment_graph(Weylgroup)
	for perm in W.bruhat_interval(W.unit(),W.long_element()):
		new_graph.nodes.update({perm:Node(perm, y_subs(x_permute(perm,expr)))})
	return new_graph


def Delta(i, graph):
	new_graph = Moment_graph(graph.W)
	for perm in graph.nodes:
		new_graph.nodes.update({perm:Node(perm,
		(graph.nodes[perm].value/y_permute(perm, op(y[i-1],om(y[i])))
		+ graph.nodes[perm*s[i]].value/y_permute(perm, op(y[i],om(y[i-1])))).simplify_full()
		)})	
	return new_graph
	
	# I will also need to multiply and add moment graphs
	# Basically it's just componentwise arithmetic

def add_moment_graphs(graph1, graph2):
	if graph1.W != graph2.W:
		return 0
	new_graph = Moment_graph(graph1.W)
	for perm in graph1.nodes:
		new_graph.nodes.update({perm:Node(perm,graph1.nodes[perm].value+graph2.nodes[perm].value)})
	return new_graph

def multiply_moment_graphs(graph1, graph2):
	if graph1.W != graph2.W:
		return 0
	new_graph = Moment_graph(graph1.W)
	for perm in graph1.nodes:
		new_graph.nodes.update({perm:Node(perm,graph1.nodes[perm].value*graph2.nodes[perm].value)})
	return new_graph


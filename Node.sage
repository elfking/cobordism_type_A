# Program: Node.sage
# Purpose: define class of nodes in a moment graph
# Author: Anh Huynh
# Created: 6/03/13
# Latest version: 6/03/13

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


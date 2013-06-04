#Program: Define the class of RC-graphs
#Purpose: Represent an RC-graph in terms of an mxm matrix of 0s and 1s
#Author: Anh Huynh
#Created: 6/03/13
#Latest version: 6/03/13

load reduced_word_to_element.sage

class RC_graph:
# has attribute self.graph, an mxm array of 0s and 1s, set to 0s by default
# compatible_word(self) gives the compatible sequence alpha
# reduced_word(self) gives the reduced sequence
# permutation(self) gives the permutation from the reduced sequence, duplicates but makes execution code shorter
# value(self) gives the corresponding monomial
# is_RC_graph(self) checks if this is actually an RC-graph

	def __init__(self,m):
		self.graph = ([0]*m)*m

	def compatible_word(self):
		comp_word = []
		for i in range(m):
			for j in range(m-i):
				if (self.graph[i][j] == 1):
					comp_word += [i+1]
		return comp_word

	def reduced_word(self):
		reduced_word = []
		for i in range(m):
			for j in reversed(range(m-i)):
				if (self.graph[i][j] == 1):
					reduced_word += [i+j+1]
		return reduced_word

	def permutation(self):
		return reduced_word_to_element(self.reduced_word())
	
	def value(self):
		value = 1
		for i in range(m):
			for j in range(m-i):
				if (self.graph[i][j] == 1):
					value *= x[i]
		return value
	
	def is_RC_graph(self):
		if (self.value().degree() == self.permutation().length()):
			return TRUE
		else:
			return FALSE

# Program: Moment_graph.sage
# Purpose: define the class of moment graphs
# Author: Anh Huynh
# Created: 6/03/13
# Latest version: 6/03/13

class Moment_graph:
	def __init__(self, Weyl_group):
		self.W 		= Weyl_group
		# hash perm -> node
		self.nodes 	= dict()
		for perm in self.W.bruhat_interval(self.W.unit(),self.W.long_element()):
			self.nodes.update( {perm:Node(perm, 0)})


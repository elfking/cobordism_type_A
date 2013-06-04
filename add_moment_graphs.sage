# Program: add_moment_graphs.sage
# Purpose: add two moment graphs, entry by entry
# Author: Anh Huynh
# Created: 6/03/13
# Latest verstion: 6/03/13

def add_moment_graphs(graph1, graph2):
	if graph1.W != graph2.W:
		return 0
	new_graph = Moment_graph(graph1.W)
	for perm in graph1.nodes:
		new_graph.nodes.update({perm:Node(perm,graph1.nodes[perm].value+graph2.nodes[perm].value)})
	return new_graph


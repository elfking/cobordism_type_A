# Program: Delta.sage
# Purpose: Apply the divided difference operator to a moment graph
# Author: Anh Huynh
# Created: 6/03/13
# Latest version: 6/03/13

def Delta(i, graph):
	new_graph = Moment_graph(W)
	for perm in bi: #graph.nodes:
		new_graph.nodes.update({perm:Node(perm,
		(graph.nodes[perm].value/y_permute(perm, op(y[i-1],om(y[i])))
		+ graph.nodes[perm*s[i]].value/y_permute(perm, op(y[i],om(y[i-1])))).simplify_full()
		)})	
	return new_graph


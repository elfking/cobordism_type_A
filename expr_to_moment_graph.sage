# Program: expr_to_moment_graph.sage
# Purpose: create a moment graph that corresponds to an expression
# Author: Anh Huynh
# Created: 6/03/13
# Latest version: 6/03/13

def expr_to_moment_graph(Weylgroup,expr):
	new_graph = Moment_graph(Weylgroup)
	for perm in W.bruhat_interval(W.unit(),W.long_element()):
		new_graph.nodes.update({perm:Node(perm, y_subs(x_permute(perm,expr)))})
	return new_graph


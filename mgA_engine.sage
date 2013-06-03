# Program: Engine
# Purpose: define moment graphs in type A, given explicit group law
# Author: Anh Huynh
# Date: 6/03/13
# Latest version: 6/03/13

load mgA_chassis.sage

def engine(m, law):
	top_poly = 1
	for i in range(m):
		for j in range(m-i):
			top_poly *= op(x[i],om(y[m-i]))
	Z_id = expr_to_moment_graph(W,top_poly)
	#just defined Z_id, the top moment graph

	lomg = dict({"[]":Z_id})
	# list of moment graphs
	reduced_words_A = []
	for perm in bi:
		reduced_words_A += perm.reduced_words()
		# list of reduced words

	reduced_words_A.reverse()
	reduced_words_A.pop(0)
	
	for reduced_word in reduced_words_A:
		parent_name = str(reduced_word[1:])
		lomg.update({str(reduced_word):Delta(reduced_word[0],lomg[parent_name])})

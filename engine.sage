# Program: engine.sage
# Purpose: compute all Bott-Samelson classes in type A
# Author: Anh Huynh
# Date: 6/03/13
# Latest version: 6/03/13

attach mgA_header.sage

def engine(m, law):
	Z_id = top_class(m)
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

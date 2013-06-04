# Program: reduced_word_to_element.sage
# Purpose: gives the element of the Weyl group that has the given reduced word
# Author: Anh Huynh
# Created: 6/03/13
# Latest version: 6/03/13

def reduced_word_to_element(reduced_word):
	w = e
	for i in reduced_word:
		w = w*s[i]
	return w

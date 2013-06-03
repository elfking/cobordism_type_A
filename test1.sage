# Program: Test Drive 1
# Purpose: compute moment graphs in type A3, additive law
# Author: Anh Huynh
# Date: 06/3/13
# Latest version: /13

t = cputime()

load mgA_engine.sage

m = 3
law = "additive"
print "working"
engine(m, law)
print "done"
print cputime(t)

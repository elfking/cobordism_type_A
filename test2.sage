# Program: Test Drive 2
# Purpose: compute moment graphs in type A3, tangent law
# Author: Anh Huynh
# Date: 06/3/13
# Latest version: /13

t = cputime()

load mgA_engine.sage

m = 3
law = "tangent"
print "working"
engine(m, law)
print "done"
print cputime(t)

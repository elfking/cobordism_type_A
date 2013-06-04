# Program: Test Drive 2
# Purpose: compute moment graphs in type A3, tangent law
# Author: Anh Huynh
# Date: 06/3/13
# Latest version: /13

t = cputime()

load mgA_header.sage
load engine.sage

m = 3
law = "tangent"
[W, s, w0, e, bi, x, y, temp]=initiation(m)
print "ignited!"
engine(m, law)
print cputime(t)
save_session('tangent_law_A3_060313')

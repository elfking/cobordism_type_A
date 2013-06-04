# Program: Test Drive 3
# Purpose: compute moment graphs in type A4, multiplicative law
# Author: Anh Huynh
# Date: 06/3/13
# Latest version: /13

t = cputime()

load mgA_header.sage
load engine.sage

m = 4
law = "multiplicative"
print "ignited!"
[W, s, w0, e, bi, x, y, temp]=initiation(m)
engine(m, law)
print cputime(t)
save_session('multiplicative_law_A4_060313')

# Program: Test Drive 1
# Purpose: compute moment graphs in type A3, additive law
# Author: Anh Huynh
# Date: 06/3/13
# Latest version: /13

# /usr/lib/sagemath/local/bin

t = cputime()

#import sys
#from sage.all import *
sage.misc.reset.reset_attached(); reset_load_attach_path()
t_dir = tmp_dir()
load_attach_path(t_dir)
#sys.path.append('~/Dropbox/Mathematics/Work/Cobordism type A')

#print sys.path
attach mgA_header.sage
attach engine.sage

m = 3
law = "multiplicative"
[W, s, w0, e, bi, x, y, temp]=initiation(m)
print "ignited!"
engine(m, law)
print cputime(t)

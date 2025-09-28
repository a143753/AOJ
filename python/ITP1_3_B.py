import sys

l = map(int, sys.stdin.readlines())
for i,v in enumerate(l):
    if v == 0:
        break
    else:
        print("Case {}: {}".format(i+1, v))

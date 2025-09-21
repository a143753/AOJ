import sys

lines = map(int,sys.stdin.readlines())
s = sorted(lines, reverse=True)

for i in range(3):
    print("{}".format(s[i]))


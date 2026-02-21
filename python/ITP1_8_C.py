import sys

def update( line, table ):
    for c in line:
        if c.isupper():
            i = ord(c) - ord('A')
            table[i] += 1
        elif c.islower():
            i = ord(c) - ord('a')
            table[i] += 1

table = [0]*26
for line in sys.stdin:
    update(line, table)

for i in range(26):
    c = chr( i + ord('a') )
    print(c, ":", table[i])

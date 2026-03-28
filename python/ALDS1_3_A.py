e = input().split()
s = []

for c in e:
    if c == "+":
        s.append(s.pop() + s.pop())
    elif c == "-":
        a = s.pop()
        b = s.pop()
        s.append(b - a)
    elif c == "*":
        s.append(s.pop() * s.pop())
    else:
        s.append(int(c))
print(s[0])

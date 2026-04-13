t = input()
s = input()

for i in range(len(t)):
    if t[i:i+len(s)] == s:
        print(i)

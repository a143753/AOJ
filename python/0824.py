n = int(input())
s = input()

c = 0
for i in range(n-2):
    if (s[i] == 'A' or s[i] == 'I' ) and s[i+1] == 'O' and s[i+2] == 'I':
        c += 1
print(c)

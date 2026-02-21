s = input() * 2
p = input()

ls = len(s)
lp = len(p)

for i in range(ls - lp):
    if p == s[i:i+lp]:
        print("Yes")
        exit(0)
print("No")



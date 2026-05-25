n = int(input())
a = map(int, input().split())
s = sorted(list(set(a)))

def search(v, a, f, t):
    for i in range(f,t):
        if v == a[i]:
            return True
        elif v < a[i]:
            return False
    return False

for i in range(len(s)):
    x = s[i]
    if search(x+3, s, i+1, len(s)) and search(x+6, s, i+1, len(s)):
        print("Yes")
        exit()
print("No")

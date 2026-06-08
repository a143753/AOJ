[n,a,b] = list(map(int, input().split()))
s = input()

s1 = s[0:a-1]
s2 = s[a-1:b]
s3 = s[b:n]

r2 = s2[::-1]


print(s1 + r2 + s3)

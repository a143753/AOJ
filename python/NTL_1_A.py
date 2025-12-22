a = int(input())

ans = []
val = a

while True:
    if val % 2 == 0:
        val //= 2
        ans.append(2)
    else:
        break
    
div = 3
while True:
    if val == 1:
        break
    elif val < div * div:
        break
    elif val % div == 0:
        val //= div
        ans.append(div)
    else:
        div += 2

if val != 1:
    ans.append(val)
    
print(f"{a}:", " ".join(map(str, ans)))

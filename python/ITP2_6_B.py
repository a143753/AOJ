_ = input()
a = list(map(int, input().split()))
_ = input()
b = list(map(int, input().split()))

ia = 0
ib = 0
while ia < len(a) and ib < len(b):
    if a[ia] < b[ib]:
        ia += 1
    elif a[ia] == b[ib]:
        ia += 1
        ib += 1
    else:
        print(0)
        exit(0)

if ib != len(b):
    print(0)
else:
    print(1)

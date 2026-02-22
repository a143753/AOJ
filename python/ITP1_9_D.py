word = input()
n = int(input())

for _ in range(n):
    line = input().split()
    c = line[0]
    a = int(line[1])
    b = int(line[2])

    if c == "replace":
        word = word[0:a] + line[3] + word[b+1:]
    elif c == "reverse":
        r = ''.join(reversed(word[a:b+1]))
        word = word[0:a] + r + word[b+1:]
    elif c == "print":
        print(word[a:b+1])


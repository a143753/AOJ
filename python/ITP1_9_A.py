word = input()

n = 0
while True:
    line = input()

    if line == "END_OF_TEXT":
        break
    else:
        for str in line.split():
            if str.lower() == word:
                n += 1
print(n)

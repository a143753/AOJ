while True:
    line = input()
    if line == "END OF INPUT":
        break
    words = line.split(" ")
    for w in words:
        print(len(w), end="")
    print()

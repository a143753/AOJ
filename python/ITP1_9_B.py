while True:
    card = input()
    if card == "-":
        break
    else:
        n = int(input())
        for _ in range(n):
            h = int(input())
            card = card[h:] + card[0:h]
        print(card)


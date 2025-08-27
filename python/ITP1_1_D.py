s = int(input())
h = s / (60*60)
m = (s / 60) % 60
s = s % 60
print("%d:%d:%d" % (int(h), int(m), int(s)))

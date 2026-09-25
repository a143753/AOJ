import sys

st = []
for line in sys.stdin:
    n = int(line)
    if n == 0:
        print(st.pop())
    else:
        st.append(n)

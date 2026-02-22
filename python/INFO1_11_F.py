n = int(input())

for i in range(n):
    a = map(int,input().split())
    print( " ".join( map( lambda x : str( x + i + 1 ), a ) ) )

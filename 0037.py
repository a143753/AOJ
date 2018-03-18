class Board:
    def __init__(self,m):
        self.m = m
        self.x = 0
        self.y = 0
        self.d = 'e'

    def dir(self):
        return self.d

    def is_origin(self):
        return (self.x==0) and (self.y==0)
        
    def north_is_wall(self):
        if self.y == 0:
            return False
        else:
            if self.m[2*self.y-1][self.x] == '1':
                return True
            else:
                return False

    def east_is_wall(self):
        if self.x == 4:
            return False
        elif m[2*self.y][self.x] == '1':
            return True
        else:
            return False
    def west_is_wall(self):
        if self.x == 0:
            return False
        elif m[2*self.y][self.x-1] == '1':
            return True
        else:
            return False
    def south_is_wall(self):
#        print("x={},y={}".format(self.x,self.y))
        if self.y == 4:
            return False
        elif self.m[2*self.y+1][self.x] == '1':
            return True
        else:
            return False

    def go_north(self):
        if self.y == 0:
            raise "invalid"
        else:
            self.y -= 1
            self.d = 'n'
        print("U",end="")

    def go_south(self):
        if self.y == 5:
            raise "invalid"
        else:
            self.y += 1
            self.d = 's'
        print("D",end="")

    def go_east(self):
        if self.x == 4:
            raise "go_east"
        else:
            self.x += 1
            self.d = 'e'
        print("R",end="")

    def go_west(self):
        if self.x == 0:
            raise "go_west"
        else:
            self.x -= 1
            self.d = 'w'
        print("L",end="")


def run(m):
    b = Board(m)
    init = True
    while True:
        d = b.dir()
        if d == 'e':
            if   b.north_is_wall():
                b.go_north()
            elif b.east_is_wall():
                b.go_east()
            elif b.south_is_wall():
                b.go_south()
            else:
                b.go_west()
        elif d == 's':
            if   b.east_is_wall():
                b.go_east()
            elif b.south_is_wall():
                b.go_south()
            elif b.west_is_wall():
                b.go_west()
            else:
                b.go_north()
        elif d == 'w':
            if b.south_is_wall():
                b.go_south()
            elif b.west_is_wall():
                b.go_west()
            elif b.north_is_wall():
                b.go_north()
            else:
                b.go_east()
        elif d == 'n':
            if  b.west_is_wall():
                b.go_west()
            elif b.north_is_wall():
                b.go_north()
            elif b.east_is_wall():
                b.go_east()
            else:
                b.go_south()

        if (not init) and b.is_origin():
            print()
            break
        init = False

m = []
for _ in range(9):
    m.append(list(input()))

run(m)


class Board
  def initialize t
    @b = Array.new(144,0)
    (0..11).each do |x|
      (0..11).each do |y|
        if t[x][y] == "1" then
          @b[12*x+y] = 12*x+y+1
        end
      end
    end
  end

  def print
    (0..11).each do |x|
      (0..11).each do |y|
        if @b[12*x+y] != 0 then
          printf("%02x", @b[12*x+y])
        else
          printf( "  " )
        end
      end
      printf("\n")
    end
  end

  def neibor x, y
    n = []

    if @b[12*x+y] == 0 then
      return n
    else
      [ [x,y], [x-1,y], [x+1,y], [x,y-1], [x,y+1] ].each do |(xx,yy)|
        if 0 <= xx and xx < 12 and 0 <= yy and yy < 12 then
          v = @b[12*xx+yy]
          n.push v if v != 0
        end
      end
      n.uniq.sort
    end
  end

  def update tgt, val
    n = 0
    (12*12).times do |i|
      if tgt.include? @b[i] then
        @b[i] = val
        n += 1
      end
    end
    return n
  end

  def res
    @b.uniq.delete_if { |x| x == 0 }.size
  end
  
end

def solve t
  b = Board.new t
  while true
    c = 0
    12.times do |x|
      12.times do |y|
        n =  b.neibor(x,y)
        t =  n.shift
        c += b.update(n,t)
      end
    end
    break if c == 0
  end
#  b.print
  b.res
end

while not $stdin.eof? do
  t = []
  12.times do
    t.push $stdin.gets
  end
  $stdin.gets

  a = solve t

  printf("%d\n",a)
  
end

wht = $stdin.gets.split(' ').map { |i| i.to_i }

pp = $stdin.gets.to_i

c = []
pp.times do
  c.push $stdin.gets.split(' ').map { |i| i.to_i }
end

f = []
wht[1].times do
  f.push $stdin.gets.split(' ').map { |i| i.to_i }
end

g = Array.new( wht[1] ).map{ Array.new( wht[0], 0 ) }

c.each do |cc|
  w = cc[0]
  h = cc[1]

  if f[h][w] == 1 then
    g[h][w] += 1
  end
end

p g.map{ |e| e.sum }.sum

def ans b, m, n
  r = 1
  while true
    r_new = r
    m.times do |m0|
      n.times do |n0|
        if b[n0][m0] == '@' then

          if (n0 - 1 >= 0) and (b[n0-1][m0] == '.') then
            b[n0-1][m0] = '@'
            r_new += 1
          end

          if (n0 + 1 < n) and (b[n0+1][m0] == '.') then
            b[n0+1][m0] = '@'
            r_new += 1
          end

          if (m0 - 1 >= 0) and (b[n0][m0-1] == '.') then
            b[n0][m0-1] = '@'
            r_new += 1
          end

          if (m0 + 1 < m) and (b[n0][m0+1] == '.') then
            b[n0][m0+1] = '@'
            r_new += 1
          end
        end
      end
    end
    if r_new == r then
      break
    else
      r = r_new
    end      
  end
  return r
end

while true do

  mn = $stdin.gets.chop.split(/ /).map { |x| x.to_i }
  m = mn[0]
  n = mn[1]

  if m == 0 and n == 0 then
    break
  else
    b = []
    n.times do
      b.push $stdin.gets.chomp
    end

    r = ans b, m, n
    printf("%d\n", r)
  end
  
end

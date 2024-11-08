while true do

  n = $stdin.gets.to_i
  break if n == 0

  t = {}
  
  l = $stdin.gets.split(/\s*/)

  m = 0
  l.each do |e|
    if t[e] then
      t[e] += 1
    else
      t[e] =  1
    end

    m += 1

    s = t.sort { |a, b| b[1] <=> a[1] }
    if (s.size == 1) and (s[0][1] > (n-m)) then
      break
    elsif (s.size > 1) and ((s[0][1] - s[1][1]) > (n-m)) then
      break
    end
  end

  s = t.sort { |a, b| b[1] <=> a[1] }

  if s.size == 1 then
    printf("%s %d\n", s[0][0], m )
  elsif s[0][1] > s[1][1] then
    printf("%s %d\n", s[0][0], m )
  else
    printf("TIE\n")
  end

end

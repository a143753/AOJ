ans' n p i = if p > i then n else ans' (n+1) (p*2) i
ans i = ans' 0 1 i

main = do
  l <- getLine
  let i = read l
      o = ans i
  print o

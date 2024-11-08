ans' n p i = if p >= i then n else ans' (n+1) (p*3) i
ans i = ans' 1 3 i

main = do
  l <- getLine
  let i = read l
      o = ans i
  print o

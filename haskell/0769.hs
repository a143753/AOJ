f c = case c of
  'j' -> 2
  'o' -> 1
  'i' -> 2
ans s = sum $ map f s

main = do
  _ <- getLine
  i <- getLine
  let o = ans i
  print o

main = do
  l <- getLine
  let i = read l :: Int
      o = i * 32
  print o

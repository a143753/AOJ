ans i = ( i - 30 ) `div` 2

main = do
  l <- getLine
  let i = read l :: Int
      o = ans i
  print o
      

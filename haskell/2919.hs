main = do
  l <- getLine
  let [n,a,b,c] = map read $ words l :: [Int]
      o = n - a - b + c
  print o
  

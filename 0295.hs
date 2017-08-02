main = do
  l <- getLine
  let (d:c:_) = map read $ words l :: [Int]
      o = d*c
  print o
        

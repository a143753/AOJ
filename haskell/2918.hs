main = do
  _ <- getLine
  l <- getLine
  let i = map read $ words l :: [Int]
      o = length $ filter even i
  print o
  

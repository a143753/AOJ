main = do
  l <- getLine
  let o = sum $ map read $ words l :: Int
  print o
  

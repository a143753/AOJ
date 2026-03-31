main = do
  [a, b] <- map read <$> lines<$> getContents :: IO [Int]
  let o = a * b
  print o
  

main = do
  [a,b,c] <- map read <$> take 3 <$> lines <$> getContents :: IO [Int]
  print $ a - b * c

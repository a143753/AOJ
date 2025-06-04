main = do
  [i1,i2] <- map read <$> take 2 <$> lines <$> getContents :: IO [Int]
  print $ i1 - i2

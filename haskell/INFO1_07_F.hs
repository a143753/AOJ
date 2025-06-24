main = do
  i <- take 3 <$> map read <$> lines <$> getContents :: IO [Int]
  print $ minimum i

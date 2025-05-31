main = do
  i <- take 2 <$> lines <$> getContents
  putStr (unlines i)

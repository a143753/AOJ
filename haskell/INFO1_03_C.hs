main = do
  i <- reverse <$> take 3 <$> lines <$> getContents
  putStr (unlines i)

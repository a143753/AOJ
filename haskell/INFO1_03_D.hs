main = do
  i <- unwords <$> reverse <$> words <$> getLine
  putStrLn i

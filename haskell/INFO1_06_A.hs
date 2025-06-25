main = do
  a <- (== 1) <$> read <$> getLine :: IO Bool
  print $ not a

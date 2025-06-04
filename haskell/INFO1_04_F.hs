main = do
  i1 <- read <$> getLine :: IO Int
  print $ i1 ^ 10

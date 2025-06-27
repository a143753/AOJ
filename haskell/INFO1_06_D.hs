main = do
  a <- read <$> getLine :: IO Int
  print $ elem a [2,3,5,7]

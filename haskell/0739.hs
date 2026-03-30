main = do
  x <- read <$> getLine :: IO Int
  let o = x * 24
  print o

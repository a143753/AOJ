main = do
  x <- read <$> getLine :: IO Int
  let o = x * x * x
  print o

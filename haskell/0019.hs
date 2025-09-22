ans 1 = 1
ans n = n * ans (n - 1)

main = do
  i <- read <$> getLine :: IO Int
  print $ ans i
  

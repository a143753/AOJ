f a = a + 1

main = do
  x <- read <$> getLine :: IO Int
  print $ f x
  

main = do
  i <- read <$> getLine :: IO Int
  putStrLn $ show (i ^ 3)

main = do
  n <- read <$> getLine :: IO Int
  mapM_ putStrLn $ take n $ repeat w
  where
    w = "hello"

main = do
  n <- read <$> getLine :: IO Int
  mapM_ (putStrLn .show) $ take n $ [1..]

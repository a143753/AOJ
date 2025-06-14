main = do
  n <- read <$> getLine :: IO Int
  i <- map read <$> take n <$> lines <$> getContents :: IO [Int]
  let a = map (\ a -> unwords [ take a $ repeat '#', show a ]) i
  mapM_ putStrLn a

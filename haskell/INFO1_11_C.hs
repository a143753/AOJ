main = do
  n <- read <$> getLine ::IO Int
  c <- getContents
  mapM_ putStrLn $ map (unwords . words) $ take n $ lines c

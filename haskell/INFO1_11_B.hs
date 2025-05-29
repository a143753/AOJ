main = do
  l <- getLine
  mapM_ putStrLn $ reverse $ words l

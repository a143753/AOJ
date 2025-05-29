main = do
  l <- getLine
  mapM_ putStrLn $ words l

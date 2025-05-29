main = do
  l <- getLine
  let o =  map (\n -> n + 1) $ map read $ words l :: [Int] 
  mapM_ (putStrLn . show) o

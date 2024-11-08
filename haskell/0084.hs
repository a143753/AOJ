main = do
  l <- getLine
  let i = unwords $ filter (\x -> length(x) >= 3 && length(x) <= 6) $ map (filter (\x-> x /= ',' && x /= '.') ) $ words l
  putStrLn i
                

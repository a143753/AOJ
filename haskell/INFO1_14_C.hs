ans a q = if elem q a then "Yes" else "No"

main = do
  _ <- getLine
  a <- map read . words <$> getLine :: IO [Int]
  _ <- getLine
  q <- map read <$> lines <$> getContents :: IO [Int]
  let o = map (ans a) q
  mapM_ putStrLn o
  

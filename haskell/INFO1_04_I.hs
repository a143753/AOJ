main = do
  [a,b] <- map read <$> take 2 <$> lines <$> getContents :: IO [Int]
  print $ a - ( a`div` b ) * b

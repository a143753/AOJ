main = do
  [a,b,c,d] <- take 4 <$> map read <$> lines <$> getContents :: IO [Int]
  print $ ( a == b ) || ( c == d )

main = do
  [a,b,c,d,e] <- map read <$> take 5 <$> lines <$> getContents :: IO [Int]
  print $ a * b ^ 3 + c * d `div` e - 100

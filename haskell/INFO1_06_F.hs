main = do
  [a,b,c] <- take 3 <$> map read <$> lines <$> getContents :: IO [Int]
  let a' = a == 1
  let b' = b == 1
  let c' = c == 1
  print $ ( not (a' && b') ) || c'

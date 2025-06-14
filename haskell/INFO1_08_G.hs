main = do
  n <- read <$> getLine :: IO Int
  t <- read <$> getLine :: IO Int
  c <- take n <$> map read <$> lines <$> getContents :: IO [Int]
  let a = head $ dropWhile (< t) $ scanl (+) 0 c
  print a

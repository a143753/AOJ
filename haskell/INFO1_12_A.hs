main = do
  [n,m] <- map read <$> words <$> getLine :: IO [Int]
  c <- map (map read) <$> map words <$> lines <$> getContents :: IO [[Int]]
  let a = take n c
  let [i,j] = head $ drop n c
  print ((a!!i)!!j)
  

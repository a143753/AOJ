main = do
  [a,b] <- take 2 <$> map read <$> lines <$> getContents :: IO [Int]
  putStrLn $ if a == b then "1" else "0"

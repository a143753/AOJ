ans x i = length $ filter (>= x) i

main = do
  [n,x] <- map read . words <$> getLine :: IO [Int]
  i <- take n <$> map read . lines <$> getContents :: IO [Int]
  let o = ans x i
  putStrLn $ show o

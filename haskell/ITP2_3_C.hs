ans a [b, e, k] = length $ filter (== k) p
  where
    p = drop b $ take e a

main = do
  _ <- getLine
  a <- map read <$> words <$> getLine :: IO [Int]
  _ <- getLine
  q <- map (map read) <$> map words <$> lines <$> getContents :: IO [[Int]]
  let o = map (ans a) q
  mapM_ print o

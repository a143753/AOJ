ans [] _ = 0
ans (a:as) b = s + (ans as b)
  where
    s = length $ filter (\x -> x >= a) b

main = do
  _ <- getLine
  a <- map read <$> words <$> getLine :: IO [Int]
  b <- map read <$> words <$> getLine :: IO [Int]
  let o = ans a b
  print o

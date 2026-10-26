ans [] [] = []
ans (a:as) (b:bs) = (a:b:ans as bs)

main = do
  _ <- getLine
  a <- map read . words <$> getLine :: IO [Int]
  b <- map read . words <$> getLine :: IO [Int]
  let o = ans a b
  mapM_ print o

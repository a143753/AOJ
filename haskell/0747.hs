ans n a = map (\i -> maximum [mx-i, i-mn] ) a
  where
    mx = maximum a
    mn = minimum a

main = do
  n <- read <$> getLine :: IO Int
  a <- map read . words <$> getLine :: IO [Int]
  let o = ans n a
  mapM_ print o

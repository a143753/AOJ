genb m a = map (\x -> length $ filter (==x) a) [1..m]

ans m n a = maximum b
  where
    b = genb m a

main = do
  [n,m] <- map read . words <$> getLine :: IO [Int]
  a <- map read . words <$> getLine :: IO [Int]
  let o = ans m n a
  print o

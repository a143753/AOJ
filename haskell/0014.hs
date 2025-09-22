ans d x
  | x == 600 = 0
  | otherwise = (x*x*d) + (ans d (x + d))

main = do
  is <- map read <$> lines <$> getContents :: IO [Integer]
  let o = map (\d -> ans d 0) is
  mapM_ print o

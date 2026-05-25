ans c [] [] = c
ans c (a:as) [] = ans (a:c) as []
ans c [] (b:bs) = ans (b:c) [] bs

ans c (a:as) (b:bs)
  | a <= b = ans (a:c) as (b:bs)
  | otherwise = ans (b:c) (a:as) bs

main = do
  _ <- getLine
  a <- map read . words <$> getLine :: IO [Int]
  b <- map read . words <$> getLine :: IO [Int]
  let o = reverse $ ans [] a b
  mapM_ print o

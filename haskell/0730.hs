ans' x [] = 0
ans' x (y:ys) = a + r
  where
    z = x * y
    a = length $ filter (==z) ys
    r = ans' x ys

ans [] = 0
ans (x:xs) = p + q
  where
    p = ans' x xs
    q = ans xs 

main = do
  _ <- getLine
  a <- map read <$> words <$> getLine :: IO [Int]
  let o = ans a
  print o

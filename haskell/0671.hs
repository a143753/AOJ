ans n (a:[]) = n
ans n (a0:a1:as) =
  if a0 <= a1
  then ans (n + 1) (a1:as)
  else maximum [ n, ans 1 (a1:as) ]

main = do
  _ <- getLine
  a <- map read . words <$> getLine :: IO [Int]
  let o = ans 1 a
  print o

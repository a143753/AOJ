scan l m n [] = [(l,m,n)]
scan l m n (a:as) =
  if a == 0
  then (l,m,n):scan (l+1) m n as
  else (l,m,n):scan (l+1) (m+1) (n-1) as

ans a = minimum $ map (\(l,m,n) -> l - m + n) $ scan 0 0 n a
  where n = length $ filter (== 1) a

main = do
  _ <- getLine
  a <- map read . words <$> getLine
  let o = ans a
  print o

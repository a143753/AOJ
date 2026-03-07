ans s a b = ( abs ( nb - na ) ) - 1
  where
    na = length $ takeWhile (/= a) s
    nb = length $ takeWhile (/= b) s

main = do
  a <- getLine
  b <- getLine
  _ <- getLine
  s <- lines <$> getContents
  let o = ans s a b
  print o
  

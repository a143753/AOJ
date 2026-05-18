ans a = [ h, t ]
  where
    x = maximum a
    h = sum $ takeWhile (/= x) a
    t = sum $ tail $ dropWhile (/= x) a

main = do
  _ <- getLine
  a <- map read . words <$> getLine
  let o = ans a
  mapM_ print o

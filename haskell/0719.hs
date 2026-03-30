ans _ [] = []
ans (s:sr) ("READ":qr) = s:(ans sr qr)
ans s (q:qr) = ans (q:s) qr

main = do
  _ <- getLine
  q <- lines <$> getContents
  let o = ans [] q
  mapM_ putStrLn o

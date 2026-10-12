main = do
  [a,b] <- map read . lines <$> getContents
  let o = a + 300 * b
  print o

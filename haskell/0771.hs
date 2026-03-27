ans h m = h * 60 + m

main = do
  h <- read <$> getLine :: IO Int
  m <- read <$> getLine :: IO Int
  let o = ans h m
  print o

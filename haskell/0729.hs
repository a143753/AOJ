ans x = (sum x) - (minimum x) - (maximum x)

main = do
  _ <- getLine
  a <- map read <$> words <$> getLine :: IO [Int]
  let o = ans a
  print o

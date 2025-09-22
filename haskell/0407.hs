ans x = (max - min + 1) `div` 2
  where
    min = minimum x
    max = maximum x

main = do
  _ <- getLine
  i <- map read <$> words <$> getLine :: IO [Int]
  let o = ans i
  print o

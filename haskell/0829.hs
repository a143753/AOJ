ans i = sum $ map maximum i

main = do
  _ <- getLine
  i <- map (map read) <$> map words <$> lines <$> getContents :: IO [[Int]]
  let o = ans i
  print o

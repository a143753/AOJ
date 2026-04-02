ans s [] b = s
ans s (a:ar) b =
  let s' = a + s
      s'' = if s' `elem` b then 0 else s'
  in
    ans s'' ar b

main = do
  _ <- getLine
  a <- map read <$> words <$> getLine :: IO [Int]
  _ <- getLine
  b <- map read <$> words <$> getLine :: IO [Int]
  let o = ans 0 a b
  print o

ans x@(h:r) = if c then "Yes" else "No"
  where
    c = and $ map (\(a,b) -> a <= b) $ zip x r

main = do
  _ <- getLine
  i <- map read <$> words <$> getLine :: IO [Int]
  let o = ans i
  putStrLn o

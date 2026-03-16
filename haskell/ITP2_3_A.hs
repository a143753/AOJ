ans i = [min, max]
  where
    min = minimum i
    max = maximum i

main = do
  i <- map read <$> words <$> getLine :: IO [Int]
  let o = ans i
  putStrLn $ unwords $ map show o

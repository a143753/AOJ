ans = head

main = do
  n <- readLn :: IO Int
  x <- map read <$> take n <$> words <$> getLine :: IO [Int]
  let y = ans x
  print y

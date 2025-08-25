ans a k = r ++ t
  where
    (t, r) = splitAt k a

main = do
  _ <- getLine
  a <- map read <$> words <$> getLine :: IO [Int]
  k <- read <$> getLine :: IO Int

  let o = ans a k
  putStrLn $ unwords $ map show o

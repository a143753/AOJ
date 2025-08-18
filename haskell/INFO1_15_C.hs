ans x i1 i2 = x1 ++ x2 ++ x3
  where
    x1 = take i1 x
    x2 = reverse $ drop i1 $ take (i2+1) x
    x3 = drop (i2+1) x

main = do
  _ <- readLn :: IO Int
  a <- map read <$> words <$> getLine :: IO [Int]
  [i1,i2] <- map read <$> words <$> getLine :: IO [Int]
  let o = ans a i1 i2
  putStrLn $ unwords $ map show o
  

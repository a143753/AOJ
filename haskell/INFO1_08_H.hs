ans [] = []
ans a =
  if r == []
  then []
  else n:(ans $ tail r)
  where
    n = length $ takeWhile (/= 0) a
    r = dropWhile (/= 0) a
    
main = do
  n<- read <$> getLine :: IO Int
  i <- map read <$> take n <$> lines <$> getContents :: IO [Int]
  let a = ans i
  mapM_ print a

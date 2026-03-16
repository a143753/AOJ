ans [] [] = 0
ans [] (_:_) = 1
ans (_:_) [] = 0
ans (a:as) (b:bs) = if a == b
                    then (ans as bs)
                    else if a < b then 1 else 0

main = do
  _ <-getLine
  a <- map read <$> words <$> getLine :: IO [Int]
  _ <- getLine
  b <- map read <$> words <$> getLine :: IO [Int]
  let o = ans a b
  print o
  

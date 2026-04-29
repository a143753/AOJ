f (_:[]) = []
f (x:y:xs) = abs (x - y) : f (y:xs)

ans 1 a = head a
ans n a = ans (n-1) a'
  where
    a' = f a

main = do
  n <- readLn :: IO Int
  a <- map read . words <$> getLine :: IO [Int]
  let o = ans n a
  print o
  

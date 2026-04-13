ans a b = if t == 0 then 12 else t
  where
    t = (a + b) `mod` 12
  
main = do
  [a,b] <- map read <$> lines <$> getContents :: IO [Int]
  let o = ans a b
  print o

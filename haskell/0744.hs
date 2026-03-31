ans a b = if a + b * 7 <= 30 then 1 else 0

main = do
  [a,b] <- map read <$> lines <$> getContents :: IO [Int]
  let o = ans a b
  print o
      

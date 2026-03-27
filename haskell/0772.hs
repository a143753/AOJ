ans a b = sub (a + b)
  where
    sub s = if s < 10 then 1 else 1 + sub ( s `div` 10 )
    
main = do
  [a,b] <- map read <$> lines <$> getContents :: IO [Int]
  let o = ans a b
  print o

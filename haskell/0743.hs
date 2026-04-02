ans a b = a * 10 + b

main = do
  [a,b] <- map read <$> lines <$> getContents :: IO [Int]
  let o = ans a b
  print o

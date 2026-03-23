ans a b x = a + b * x

main = do
  [a,b,x] <- map read . words <$> getLine :: IO [Int]
  let o = ans a b x
  print o

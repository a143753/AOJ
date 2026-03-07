ans a = x * l - s
  where 
    x = maximum a
    l = length a
    s = sum a
    
main = do
  a <- map read <$> words <$> getLine :: IO [Int]
  let o = ans a
  print o

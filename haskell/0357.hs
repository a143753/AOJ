ans (a:b:_) = (a + b) `div` 2

main = do
  l <- getLine
  let i = map read $ words l ::[Int]
      o = ans i
  print o

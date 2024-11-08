main = do
  l <- getLine
  let [w,h,c] = map read $ words l :: [Int]
      g = gcd w h
      o = (w `div` g) * (h `div` g) * c
  print o
  

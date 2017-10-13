ans [x,y] =
  let g = gcd x y
      x'= x `div` g
      y'= y `div` g
  in
    (x'-1+y'-1+1) * g + 1

main = do
  l <- getLine
  let i = map read $ words l :: [Int]
      o = ans i
  print o
  

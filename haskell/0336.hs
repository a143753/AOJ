ans (h:r:_) =
  if h + r == 0
  then 0
  else if h + r < 0
       then -1
       else  1

main = do
  l <- getLine
  let i = map read $ words l :: [Int]
      o = ans i
  print o

ans (a:[]) = a
ans (a:as) = lcm a (ans as)

main = do
  n <- getLine
  c <- getLine
  let i = map read $ words c :: [Int]
      o = ans i
  print o
  

ans x y = abs (x - y)

main = do
  l <- getLine
  let [x,y] = map read $ words l :: [Int]
      o = ans x y
  print o
      

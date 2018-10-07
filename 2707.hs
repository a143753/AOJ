skip k l =
  let a = tail $ take k l
      r = drop k l
  in
    a ++ (skip k r)

ans 1 k l = head l
ans n k l = ans (n-1) k (skip k l)

main = do
  l <- getLine
  let [n,k] = map read $ words l :: [Int]
      o = ans n k [0 .. ]
  print o
  

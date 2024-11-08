skip k i (l:ls) =
  if i == 0 then r else l:r
  where
    i' = (i + 1) `mod` k
    r  = skip k i' ls

ans 1 k l = head l
ans n k l = ans (n-1) k (skip k 0 l)

main = do
  l <- getLine
  let [n,k] = map read $ words l :: [Int]
      o = ans n k [0 .. ]
  print o
  

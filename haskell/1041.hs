ans (0:_) = []
ans (n:xs) =
  let m = n `div` 4
      s = sum $ take m xs
      r = drop m xs
  in
    s:(ans r)

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = ans i
  mapM_ print o

sumup _ [] = []
sumup s (x:xs) =
  let s' = (s+x)
  in
    s':(sumup s' xs)

scan :: (Int,Int) -> [Int] -> (Int,Int)
scan (m,a) [] = (m,a)
scan (m,a) (x:xs) =
  let m' = min m x
      a' = max a (x-m)
  in
    scan (m',a') xs

ans (0:_) = []
ans (n:x) =
  let a = take n x
      s = (sumup 0 a)
      (_,d) = scan (0,-100000) s
      r = drop n x
  in
    d:(ans r)

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = ans i
  mapM_ print o

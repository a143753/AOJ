splitBy _ [] = []
splitBy a x =
  let s = takeWhile (/= a) x
      x'= dropWhile (/= a) x
  in
    if x' == []
    then [s]
    else s:(splitBy a $ drop 1 x')

to_m s =
  let [h,m] = map read $ splitBy ':' s :: [Int]
  in
    h*60 + m

ans' _ (_:[]) = []
ans' t ([_,_,t1,s1]:x@[t2,s2,_,_]:xs) =
  let m1 = to_m t1
      m2 = to_m t2
      st = unwords $ [s1, (show (m2-m1))]
      nx = ans' t (x:xs)
  in
    if (m2 - m1) >= t 
    then st:nx
    else nx

ans [] = []
ans ([n,t]:x) =
  let n' = read n :: Int
      t' = read t :: Int
      d  = take n' x
      r  = drop n' x
  in
    (ans' t' d):(ans r)

pr x = do
  print $ length x
  mapM_ putStrLn x

main = do
  c <- getContents
  let i = map words $ lines c
      o = ans i
  mapM_ pr o

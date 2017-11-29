t2i x = 60 * (x `div` 100) + (x `mod` 100)

ok' :: (Int,Int) -> [Int] -> [Int]
ok' (p,q) x =
  let h = head x
      t = last x
  in
    if p == h
    then if q == t
         then tail $ init x
         else tail $ x ++ [q]
    else if q == t
         then p:(init x)
         else p:(x ++ [q])

ok _ [] = []
ok (p,q) (_:x:xs) = (ok' (p,q) x):(ok (p,q) xs)

mg :: [Int] -> [Int] -> [Int]
mg a [] = a
mg [] b = b
mg a@(a0:a1:as) b@(b0:b1:bs)
  | b1 < a0                         = (b0:b1:(mg a bs))
  | b0 < a0 && a0 <= b1 && b1 <= a1 = (b0:a1:(mg as bs))
  | b0 <=a0 && a1 <= b1             = mg as b
  | a0 <=b0 && b1 <= a1             = mg a bs
  | a0 <=b0 && a1 <= b1             = mg as (a0:b1:bs)
  | a1 < b0                         = (a0:a1:(mg as b))

merge :: [[Int]] -> [Int]
merge (a:[])  = a
merge (a:b:s) = merge ((mg a b):s)

dura :: [Int] -> [Int]
dura [] = []
dura (a:b:s) =
  let am = t2i a
      bm = t2i b
  in
    (bm-am):(dura s)

ans ([0,0,0]:_) = []
ans ([n,p,q]:x) =
  let d = take (n*2) x
      r = drop (n*2) x
      a = ok (p,q) d
      m = merge a
      e = dura m
  in
    (maximum e):(ans r)

main = do
  c <- getContents
  let i = (map (map read) . map words . lines) c :: [[Int]]
      o = ans i
  mapM_ print o

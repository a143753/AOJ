--   1
-- 4 2 3 5 → 1が上面、2が正面
--   6

mov :: (Int,Int,Int,Int,Int,Int) -> Char -> (Int,Int,Int,Int,Int,Int)
mov (p1,p2,p3,p4,p5,p6) 'N' = (p2,p6,p3,p4,p1,p5)
mov (p1,p2,p3,p4,p5,p6) 'S' = (p5,p1,p3,p4,p6,p2)
mov (p1,p2,p3,p4,p5,p6) 'W' = (p3,p2,p6,p1,p5,p4)
mov (p1,p2,p3,p4,p5,p6) 'E' = (p4,p2,p1,p6,p5,p3)

ini :: [Int] -> (Int,Int,Int,Int,Int,Int)
ini (a:b:c:d:e:f:_) = (a,b,c,d,e,f)

-- 前面を合わせる
m1 :: (Int,Int,Int,Int,Int,Int) -> Int -> (Int,Int,Int,Int,Int,Int)
m1 i@(p1,p2,p3,p4,p5,p6) n
  | p2 == n            = i
  | p4 == n || p3 == n = m1 (mov i 'E') n
  | otherwise          = m1 (mov i 'N') n

m2 :: (Int,Int,Int,Int,Int,Int) -> Int -> (Int,Int,Int,Int,Int,Int)
m2 i@(p1,p2,p3,p4,p5,p6) n
  | p1 == n            = i
  | otherwise          = m2 (mov i 'E') n

ans :: (Int,Int,Int,Int,Int,Int) -> [Int] -> Int
ans d q =
  let s1 = m1 d (q!!1)
      s2@(p1,p2,p3,p4,p5,p6) = m2 s1 (q!!0)
  in
    p3

main = do
  l <- getLine
  let d = ini $ map read $ words l
  c <- getContents
  let q = map (map read) $ map words $ drop 1 $ lines c :: [[Int]]
      o = map (ans d) q
  mapM_ print o

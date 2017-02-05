import Data.List

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
  | p1 == n            = m1 (mov i 'S') n
  | p2 == n            = i
  | p3 == n || p4 == n = m1 (mov i 'E') n
  | p5 == n || p6 == n = m1 (mov i 'N') n

-- 上面を合わせる
m2 :: (Int,Int,Int,Int,Int,Int) -> Int -> (Int,Int,Int,Int,Int,Int)
m2 i@(p1,p2,p3,p4,p5,p6) n
  | p1 == n            = i
  | p3 == n            = m2 (mov i 'W') n
  | p4 == n            = m2 (mov i 'E') n
  | otherwise          = m2 (mov i 'E') n

chk :: (Int,Int,Int,Int,Int,Int) -> (Int,Int,Int,Int,Int,Int) -> Bool
chk a@(a1,a2,a3,a4,a5,a6) b@(b1,b2,b3,b4,b5,b6) =
  let a'@(aa1,aa2,aa3,aa4,aa5,aa6)  = m1 a  b2
      a'' = m2 a' b1
  in
    if (aa1/=b1) && (aa4/=b1) && (aa6/=b1) && (aa3/=b1)
    then False
    else if a'' == b
         then True
         else False

ans' :: [Int] -> [[Int]] -> Bool
ans' _ [] = True
ans' d0 (d1:ds) =
  let sd0 = sort d0
      sd1 = sort d1
  in
    if sd0 /= sd1
    then ans' d0 ds
    else
      let d0' = ini d0
          d1' = ini d1
      in
        (not $ chk d0' d1') && (ans' d0 ds)

ans :: [[Int]] -> Bool
ans [] = True
ans (d1:ds) =
  let r0  = ans' d1 ds
      r1  = ans ds
  in
    r0 && r1

main = do
  c <- getContents
  let ds  = map (map read) $ map words $ drop 1 $ lines c :: [[Int]]
      o   = ans ds
  putStrLn $ if o then "Yes" else "No"

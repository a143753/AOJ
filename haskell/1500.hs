import Data.Char
import Data.List

select :: Int -> [Int] -> [[Int]]
select 0 _ = [[]]
select _ [] = [[]]
select n list =
    [ (x:xs) | x <- list, xs <- (select (n-1) $ filter (>= x) list) ]

------------------------------------------------
f :: Int -> Int
f n = if n >= 5
      then 1 + ( (n-5) * 2 )
      else n * 2

-- (*以外の計算値、奇数位置の*の数、偶数位置の*の数)
ev :: [Char] -> (Int,Int,Int)
ev [] = (0,0,0)
ev ('*':ns) =
  let (a,b,c) = od ns
  in
    (a,b,c+1)

ev (n:ns) =
  let v = f $ digitToInt n
      (a,b,c) = od ns
  in
    (a+v,b,c)

od :: [Char] -> (Int,Int,Int)
od [] = (0,0,0)
od ('*':ns) =
  let (a,b,c) = ev ns
  in
    (a,b+1,c)

od (n:ns) =
  let n' = digitToInt n
      (a,b,c) = ev ns
  in 
     (a+n',b,c)   
------------------------------------------------

fact 1 = 1
fact n = n * fact(n-1)

cnv :: [Int] -> [(Int,Int)]
cnv [] = []
cnv x@(x0:xs) =
  let l = length $ takeWhile (==x0) x
  in
    (x0,l):(cnv $ dropWhile (==x0) x)

comb :: [Int] -> Int
comb x =
  let l = fact $ length x
      m = product $ map (\(a,b) -> fact b) $ cnv x
  in
    l `div` m

chk :: Int -> [Int] -> Int
chk p yc =
  let y = sum $ map f yc
      v = p + y
  in
    if v `mod` 10 == 0
    then comb yc
    else 0

solve'' :: Int -> Int -> [Int] -> Int
solve'' p y set =
  let ycs = select y set
      res = map (\yc -> chk p yc) ycs
  in
    sum res

solve' :: Int -> Int -> [Int] -> [Int] -> Int
solve' p y set xc =
  let c  = comb xc
      p' = p + sum xc
  in
    c * solve'' p' y set

solve id set = 
  let (p,x,y) = od id -- (*以外の計算値、奇数位置の*の数、偶数位置の*の数)
      xcs = select x set
      res = map (solve' p y set ) xcs
  in
    sum res

main = do
  c <- getContents
  let l = lines c
      n  = read (l!!0) :: Int
      id = reverse $ l!!1
      m  = read (l!!2) :: Int
      s  = map read $ words (l!!3) :: [Int]
      o  = solve id s
  print o

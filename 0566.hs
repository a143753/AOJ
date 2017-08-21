import Data.List

inc 1 v (t:ts) = (t+v):ts
inc i v (t:ts) = t:(inc (i-1) v ts)

rnk :: Int -> [(Int,Int)] -> [(Int,Int,Int)]
rnk _ [] = []
rnk n ((a,b):[]) = [(a,b,n)]
rnk n x@((a,b):xs) =
  let a1 = takeWhile (\(a',b') -> b == b') x
      rs = dropWhile (\(a',b') -> b == b') x
      a2 = map (\(a,b) -> (a,b,n)) a1
      ln = length a1
  in
    a2 ++ (rnk (n+ln) rs)

chk [a,b,c,d] t
  = if c == d
    then inc b 1 $ inc a 1 t
    else if c > d
         then inc a 3 t
         else inc b 3 t

ans n i =
  let t = replicate n 0
      r = foldr chk t i
      t'= zip [1..] r
      r'= rnk 1 $ sortBy (\(_,a) (_,b) -> compare b a) t'
      rr= map (\(a,b,c)->c) $ sortBy (\(a,b,c) (d,e,f) -> compare a d) r'
  in
    rr

main = do
  n <- getLine
  c <- getContents
  let n' = read n :: Int
      i  = map (map read) $ map words $ lines c :: [[Int]]
      o  = ans n' i
  mapM_ print o
  

import Data.List

dif (x:[]) = []
dif (x0:x1:xs) =
  (x0-x1):dif (x1:xs)

a' n1 n2 d =
  let dd = drop (n1-1) $ take (n2) $ zip [1..] $ dif d
      mx = maximumBy (\ (a,b) (c,d) -> if b == d
                                       then compare a c
                                       else compare b d ) dd
      (a,b) = mx
  in
    a

ans ([0,0,0]:_) = []
ans ([m,n1,n2]:x) =
  let d = map (\ [a] -> a) $ take m x
      r = drop m x
  in
    (a' n1 n2 d):ans r    

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o
  

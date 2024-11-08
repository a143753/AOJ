
lk i (t:ts) =
  let (j,v) = t
  in
    if j == i
    then v
    else lk i ts

up :: Int -> Int -> [(Int,Int)] -> [(Int,Int)]
up i w (t:ts) =
  let (j,v) = t
  in
    if j == i
    then (j,w):ts
    else t:(up i w ts)

mapok tbl [] = tbl
mapok tbl (ok:oks) =
  let [a,b,c,d] = ok
      t' = up c 1 $ up b 1 $ up a 1 tbl
  in
    mapok t' oks

mapng tbl [] = tbl
mapng tbl (ng:ngs) =
  let [a,b,c,_] = ng
      va = lk a tbl
      vb = lk b tbl
      vc = lk c tbl
      t' = if va == 1 && vb == 1
           then up c 0 tbl
           else if va == 1 && vc == 1
                then up b 0 tbl 
                else if vb == 1 && vc == 1
                     then up a 0 tbl
                     else tbl
  in
    mapng t' ngs

ans' n l =
  let tbl = zip [1..n] $ repeat 2
      ok = filter (\ [a,b,c,d] -> d == 1) l
      ng = filter (\ [a,b,c,d] -> d == 0) l
      t1 = mapok tbl ok
      t2 = mapng t1  ng
  in
    map snd t2

ans ([0,0,0]:_) = []
ans ([a,b,c]:[n]:x) =
  let d = take n x
      r = drop n x
  in
    (ans' (a+b+c) d) ++ (ans r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o

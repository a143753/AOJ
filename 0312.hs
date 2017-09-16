-- 1つの棚の中では巻は順番にならばなくてはならないが
-- 棚自体は順不同に選んでよい。以下のlogicでは棚を順番に
-- 選んでしまっている。

ans' :: [[Int]] -> [[Int]] -> [[Int]]
ans' [] _ = []
ans' wt [] = wt
ans' ([w,t]:wts) ([c,b]:cbs)
  = if w <= c && t <= b
    then ans' wts ([c-w,b-t]:cbs)
    else ans' ([w,t]:wts) cbs

--ans :: [[Int]] -> Int
ans ([m,n]:x) =
  let wt = take m x
      cb = drop m x
      as = ans' wt cb
  in
--    m - (length as)
    as

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  print o

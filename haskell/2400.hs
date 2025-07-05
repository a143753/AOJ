import Data.List (sortBy)

cnv :: [String] -> (Int, Int, Int, String)
cnv [tid,pid,time,msg] = (read tid :: Int, read pid :: Int, read time :: Int, msg)

cmp1 (tid1, pid1, time1, _) (tid2, pid2, time2, _) =
  if tid1 == tid2
  then if pid1 == pid2
       then compare time1 time2
       else compare pid1 pid2
  else compare tid1 tid2

cmp2 (t1, n1, p1) (t2, n2, p2) = 
  if n1 == n2
  then if p1 == p2
       then compare t1 t2
       else compare p1 p2
  else compare n2 n1

sup [] = []
sup dt@((t,_,_):r) =
  let s = foldl (\(tt, pp, tm) (st, sp, sm) -> (tt, pp+sp, tm+sm) ) (t, 0, 0) $ takeWhile (\(tt, _, _) -> tt == t) dt
      r = sup $ dropWhile (\(tt, _, _) -> tt == t) dt
  in
    (s:r)

summary n x =
  let s = sortBy cmp2 x
      c = map (\(t,_,_) -> t) x
      z = map (\t -> (t,0,0) ) $ filter (\i -> not ( elem i c) ) [1..n]
  in
    s ++ z

ans'' :: [(Int, Int, Int, String)] -> (Int,Int,Int)
ans'' x =
  let (t,_,_,_) = head x
      w = length $ takeWhile (\(_, _, _, msg) -> msg == "WRONG") x
      c = dropWhile (\(_, _, _, msg) -> msg == "WRONG") x
      (_,_,tm,_) = head c
  in
    if c == []
    then (t,0,0)
    else (t,1,w * 1200 + tm)

ans' [] = []
ans' x =
  let s = sortBy cmp1 x
      (t, p, _, _) = head s
      a = ans''$ takeWhile (\(tid, pid, time, _) -> tid == t && pid == p) s
      r = ans' $ dropWhile (\(tid, pid, time, _) -> tid == t && pid == p) s
  in
    (a:r)

--ans :: [[String]] -> [(Int,Int)]
ans [] = []
ans (["0","0","0"]:_) = []
ans ([t0,p0,r0]:xs) =
  let t = read t0 :: Int
      p = read p0 :: Int
      r = read r0 :: Int
      a = summary t $ sup $ ans' $ map cnv $ take r xs
      b = ans  $ drop r xs
  in
    a ++ b

main = do
  c <- map words <$> lines <$> getContents 
  let o = ans c
  mapM_ putStrLn $ map (\(t, n, p) -> show t ++ " " ++ show n ++ " " ++ show p) o

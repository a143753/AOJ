num = [5,7,5,7,7]

acm _ [] = []
acm s (n:ns) = (s+n):acm (s+n) ns

a2 [] _ = True
a2 (n:ns) s =
  let a  = zip [1..] $ acm 0 s
      a' = dropWhile (\ (a,v) -> v < n) a
      (i,v) = a'!!0
  in
    if a' == []
    then False
    else if n == v
         then a2 ns $ drop i s
         else False

a1 idx s =
  if res
  then idx
  else a1 (idx+1) $ drop 1 s
  where
    res = a2 num s

ans ("0":_) = []
ans (n:x) =
  let n' = read n :: Int
      o  = a1 1 $ map length $ take n' x
      r  = drop n' x
  in
    o:ans r

main = do
  c <- getContents
  let i = lines c
      o = ans i
  mapM_ print o

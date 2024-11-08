mtc ([],v) [] = v
mtc ((p0:ps),v) (a0:as) =
  if p0 == '*'
  then v
  else if p0 == a0
       then mtc (ps,v) as
       else 0

ans (["0","0"]:_) = []
ans ([m',n']:x) =
  let m = read m'
      n = read n'
      t = map (\[p,v] -> (reverse p,read v)) $ take m x :: [(String,Int)]
      a = map reverse $ concat $ take n $ drop m x :: [String]
      p = sum $ concat $ map (\t0-> map (mtc t0) a) t
      r = drop (m+n) x
  in
    p:(ans r)

main = do
  c <- getContents
  let i = map words $ lines c
      o = ans i
  mapM_ print o

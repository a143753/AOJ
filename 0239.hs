cal p q r = 4*p + 9*q + r*4

chk [pp,qq,rr,cc] [s,p,q,r] =
  let c = cal p q r
  in
    (p <= pp) && (q <= qq) && (r <= rr) && (c <= cc)

ans ([0]:_) = []
ans ([n]:x) =
  let d = take n x
      t = head $ drop n x
      r = drop (n+1) x
      a = filter (chk t) d
      a'= if a == []
          then ["NA"]
          else map (\ (s:_) -> show(s) ) a
  in
    a' ++ ans r

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ putStrLn o

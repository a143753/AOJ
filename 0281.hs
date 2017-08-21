can = (1,1,1)
cca = (2,1,0)
ccc = (3,0,0)

sb (a,b,c) (d,e,f) = (a-d,b-e,c-f)
ml n (a,b,c) = (n*a,n*b,n*c)

dv x@(a,b,c) y@(d,e,f) =
  if a>=d && b>=e && c>=f
  then 1 + dv (sb x y) y
  else 0

ans a =
  let n1 = dv a  can
      r1 = sb a  $ ml n1 can
      n2 = dv r1 cca
      r2 = sb r1 $ ml n2 cca
      n3 = dv r2 ccc
      r3 = sb r2 $ ml n3 ccc
  in
    n1+n2+n3

main = do
  _ <- getLine
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      i'= map (\[a,b,c] -> (a,b,c)) i
      o = map ans i'
  mapM_ print o

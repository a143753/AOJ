chk (x1,y1) (x2,y2) (xp,yp) (xq,yq) = 
  let dp = (y2-y1) / (x2-x1) * (xp-x1) + y1 - yp
      dq = (y2-y1) / (x2-x1) * (xq-x1) + y1 - yq
  in
    if dp * dq >= 0
    then True
    else False

ans (x1:y1:x2:y2:x3:y3:xp:yp:_) =
  let c1 = chk (x1,y1) (x2,y2) (x3,y3) (xp,yp)
      c2 = chk (x2,y2) (x3,y3) (x1,y1) (xp,yp)
      c3 = chk (x3,y3) (x1,y1) (x2,y2) (xp,yp)
  in
    if c1 && c2 && c3
    then "YES"
    else "NO"

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Double]]
      o = map ans i
  mapM_ putStrLn o
  

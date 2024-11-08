ans (xa:ya:ra:xb:yb:rb:_) =
  let d = sqrt( (xa-xb)**2 + (ya-yb)**2 )
  in
    if d > ra + rb
    then 0
    else if ra > d+rb
         then 2
         else if rb > d+ra
              then -2
              else 1
main = do
  n <- getLine
  c <- getContents
  let n' = read n :: Int
      i  = map (map read) $ map words $ take n' $ lines c :: [[Double]]
      o  = map ans i
  mapM_ print o

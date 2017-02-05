dropIf _ [] = []
dropIf op (x:xs) =
  if op x
  then dropIf op xs
  else (x:(dropIf op xs))

ans :: [Double] -> String
ans [] = []
ans (xa:ya:xb:yb:xc:yc:xd:yd:_) =
  let x1 = (xb-xa)
      y1 = (yb-ya)
      x2 = (xd-xc)
      y2 = (yd-yc)
      ip = x1 * x2 + y1 * y2
  in
    if ip == 0
    then "YES"
    else "NO"
ans x = "NO"

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Double]]
      i' = dropIf (== []) i
      o = map ans i'
  mapM_ putStrLn o

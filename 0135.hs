splitBy _ [] = []
splitBy a x =
  let s = takeWhile (/= a) x
      x'= dropWhile (/= a) x
  in
    if x' == []
    then [s]
    else s:(splitBy a $ drop 1 x')

ans s =
  let [m,n] = map read $ splitBy ':' s :: [Double]
      ang_s = 360 / 12 * m + 360 / 12 / 60 * n
      ang_l = 6 * n
      diff = abs (ang_s - ang_l)
      d'   = if diff < 180 then diff else (360-diff)
  in
    if d' < 30
    then "alert"
    else if d' < 90
         then "warning"
         else "safe"

main = do
  n <- getLine
  c <- getContents
  let n' = read n :: Int
      i  = lines c
      o  = map ans i
  mapM_ putStrLn o

chk t d =
  let a = foldl (\ a (s:f:_) -> a + (f-s) ) 0 d
  in
    if a >= t
    then "OK"
    else show (t-a)

ans ([0]:_) = []
ans ([t]:[n]:x) =
  let d = take n x
      r = chk t d
      y = drop n x
  in
    r:ans y

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ putStrLn o

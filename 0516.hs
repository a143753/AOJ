ans' k d =
  if k > length d
  then 0
  else
    let a = sum $ take k d
        b = ans' k $ drop 1 d
    in
      if a > b
      then a
      else b

ans ([0,0]:_) = []
ans ([n,k]:x) =
  let d = map head $ take n x
      r = drop n x
  in
    (ans' k d):(ans r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o

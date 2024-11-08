ans ([0,0,0]:_) = []
ans ([n,m,p]:as) =
  let x = concat $ take n as
      r = drop n as
      a = if x!!(m-1) == 0
          then 0
          else (sum x) * (100-p) `div` (x!!(m-1))
  in
    a:(ans r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o

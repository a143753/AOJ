ans :: [[String]] -> [Double]
ans (["0"]:_) = []
ans (n:v:is) =
  let l = read (n!!0) :: Double
      i = map read v :: [Double]
      a = (sum i) / l
      s = foldl (\s d -> s + (d-a)*(d-a) ) 0 i
      o = sqrt $ s / l
  in
    o:(ans is)

main = do
  c <- getContents
  let i = map words $ lines c
      o = ans i
  mapM_ print o

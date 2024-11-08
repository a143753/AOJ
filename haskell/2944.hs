ans' v d = sum $ map (\i -> if i > v then v else i) d

ans ([0,0]:_) = []
ans ([n,m]:d:r) =
  (ans' (div m n) d):(ans r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o

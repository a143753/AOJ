ans ([0]:_) = []
ans ([n]:x) =
  let r = drop n x
      d = map (\ [a,b] -> (b `div` (gcd a b), a `div` (gcd a b) ) ) $ take n x
      l = foldr1 lcm $ map snd d
      g = foldr1 gcd $ map fst d
      a = map (\ (a,b) -> a * l `div` g `div` b) d
  in
    a++ans r

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o
  

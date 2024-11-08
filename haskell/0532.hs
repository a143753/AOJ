t2s h m s = ( ( h * 60 ) + m ) * 60 + s
s2t t =
  let s = t `mod` 60
      m = (t `div` 60) `mod` 60
      h = (t `div` 60) `div` 60
  in
    [h,m,s]

ans (h0:m0:s0:h1:m1:s1:_) =
  let t0 = t2s h0 m0 s0
      t1 = t2s h1 m1 s1
  in
    s2t (t1-t0)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = map ans i
  mapM_ putStrLn $ map unwords $ map (map show) o

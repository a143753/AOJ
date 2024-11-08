dig2rad x = x / 360.0 * 2 * pi

ans :: [Float] -> Int
ans [a, b, c, d] =
  round $ r * acos( sin(a')*sin(c') + cos(a')*cos(c')*cos(dx) )
  where
    r  = 6378.1
    a' = dig2rad a
    b' = dig2rad b
    c' = dig2rad c
    d' = dig2rad d
    dx = d' - b'
    
main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Float]]
      o = map ans $ takeWhile (/= [-1,-1,-1,-1]) i
  mapM_ print o

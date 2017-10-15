f n a m x =
  let x' = (a * x) `mod` m
  in
    if x' == 1
    then n + 1
    else f (n+1) a m x'

ans (a1:m1:a2:m2:a3:m3:_) =
  let n1 = f 0 a1 m1 1
      n2 = f 0 a2 m2 1
      n3 = f 0 a3 m3 1
  in
    lcm n1 $ lcm n2 n3

main = do
  c <- getContents
  let i = takeWhile (/= [0,0,0,0,0,0]) $ map (map read) $ map words $ lines c :: [[Int]]
      o = map ans i
  mapM_ print o

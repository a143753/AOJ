ans' n _ _ [] = -1
ans' n t e (d:ds) =
  let max = t + e
      min = t - e
      rem = min `mod` d
      dmn = min `div` d
      dmx = max `div` d
  in
    if rem == 0 || dmx > dmn
    then n
    else ans' (n+1) t e ds

ans ([n,t,e]:ds:_) = ans' 1 t e ds

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  print o

ans :: [[Int]] -> Int
ans [[n,c],d] =
  let s = sum d
      a = s `div` (n+1)
      b = s `mod` (n+1)
  in
    if b /= 0
    then (a + 1)
    else a

main = do
  l <- getContents
  let i = map (map read) $ map words $ lines l :: [[Int]]
      o = ans i
  print o
      

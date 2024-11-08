-- taro
p1 n x i =
  let m = (n-1) `mod` 5
      n'= n - m
  in
    n':(p2 n' x i)
-- jiro
p2 1 _ _ = [0]
p2 n x i =
  let m = x!!i
      n'= n - m
      i'= (i + 1) `mod` (length x)
  in
    n':(p1 n' x i')

ans ([0]:_) = []
ans ([_]:x) =
  let d = head x
      r = drop 1 x
  in
    (p1 32 d 0):(ans r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c
      o = ans i
  mapM_ print $ concat o

ans (0:_) = []
ans (n:m) =
  let a = n - (sum $ take 9 m)
      r = drop 9 m
  in
    a:(ans r)

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = ans i
  mapM_ print o

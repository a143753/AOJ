cal d =
  let s  = sum d
      mx = maximum d
      mn = minimum d
      l  = (length d) - 2
  in
    (s - mx - mn) `div` l

ans (0:_) = []
ans (n:ns) =
  let a = cal $ take n ns
      r = drop n ns
  in
    a:(ans r)

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = ans i
  mapM_ print o

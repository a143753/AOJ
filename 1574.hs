cdiv m n = ceiling $ (fromIntegral m) / (fromIntegral n)

ans' (a:[]) = []
ans' (a1:a2:as) = ((a2-a1-1)`cdiv`2):(ans' (a2:as))

ans [[n,m],a@(a1:as)] = maximum $ (a1-1):(ans' (a++[n+(n-al)]))
  where
    al = last a

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  print o

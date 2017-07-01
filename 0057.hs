ans 0 = 1
ans n = n + ans (n-1)

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = map ans i
  mapM_ print o

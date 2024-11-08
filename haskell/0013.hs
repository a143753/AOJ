ans s [] = s
ans (s:ss) (0:xs) = s:(ans ss xs)
ans s (n:xs) = ans (n:s) xs

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = ans [] i
  mapM_ print o

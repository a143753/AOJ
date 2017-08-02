main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = sum i
  print o

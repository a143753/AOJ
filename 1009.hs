ans [] = []
ans ((a:b:_):xs) = (gcd a b):(ans xs)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o

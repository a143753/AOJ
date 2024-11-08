ans (t:n:_)
  | t == 1 = 6000 * n
  | t == 2 = 4000 * n
  | t == 3 = 3000 * n
  | t == 4 = 2000 * n

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = map ans i
  mapM_ print o
  

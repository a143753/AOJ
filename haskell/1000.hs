ans (a:b:_) = a + b

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = map ans i
  mapM_ print o
  

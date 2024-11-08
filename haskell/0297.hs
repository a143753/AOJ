ans (k:p:_) =
  let m = k `mod` p
  in
    if m == 0
    then p
    else m

main = do
  _ <- getLine
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = map ans i
  mapM_ print o

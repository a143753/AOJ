p = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
q = [ 6, 7, 8, 9, 5, 4, 3, 2, 1, 0 ]
r = [ 6, 7, 8, 9, 5, 4, 3, 2, 1, 0, 1, 2, 3, 4, 5, 6, 7, 8 ]

ans' x [a,b] = 
  let t0 = dropWhile (/= a) x
      tr = dropWhile (/= b) t0
      t  = takeWhile (/= b) t0
  in
    if tr == []
    then Nothing
    else Just (t++[b])

ans i =
  let ap = ans' p i
      aq = ans' q i
  in
    case (ap,aq) of
      (Nothing, Just x) -> x
      (Just x, Nothing) -> x
      (Just x,  Just y) -> if (length x) <= (length y) then x else y
      (Nothing,Nothing) -> let Just z = ans' r i
                           in
                             z
main = do
  l <- getLine
  c <- getContents
  let n = read l :: Int
      i = map (map read) $ map words $ take n $ lines c :: [[Int]]
      o = map ans i
  mapM_ putStrLn $ map (\e -> unwords $ map show e ) o

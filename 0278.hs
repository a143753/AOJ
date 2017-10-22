ans (x:y:b:p:_) = 
  let a = x*b + y*p
      a'= ( x * (max b 5) + y * (max p 2) ) * 8 `div` 10
      c = if b >= 5 && p >= 2
          then a * 8 `div` 10
          else min a a'
  in
    c

main = do
  _ <- getLine
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = map ans i
  mapM_ print o

sub z3 [] = []
sub z3 l@(x:xs) =
  let y' = dropWhile (\y -> (x + y) > z3) l
      r  = sub z3 xs
  in
    if y' == []
    then r
    else (z3 - x - (y'!!0)):r

ans z =
  let z3 = z*z*z
      ls = map (\ x -> x*x*x) $ reverse $ [1..(z-1)]
  in
    minimum $ sub z3 ls

main = do
  c <- getContents
  let i = takeWhile (/= 0) $ map read $ lines c :: [Integer]
      o = map ans i
  mapM_ print o
  

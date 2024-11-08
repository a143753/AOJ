f2 e (z,z3) =
  let e' = e - z3
      y  = floor $ sqrt $ fromIntegral e'
      y2 = y^2
      x = e' - y2
  in
    (x+y+z)

f3 e =
  let y = takeWhile (\(_,z3) -> z3 <= e) $ map (\z -> (z,z^3)) $ [0..]
  in
    minimum $ map (f2 e) y

main = do
  c <- getContents
  let i = takeWhile (/= 0) $ map read $ lines c :: [Int]
      o = map f3 i
  mapM_ print o

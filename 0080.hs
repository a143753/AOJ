f q x = x - (x**3.0 - q) / (3.0*x*x)

ans' q x =
  if abs (x*x*x - q) < 0.00001 * q
  then x
  else
    ans' q (f q x)

ans q =
  let xn = q / 2.0
  in
    ans' q xn

main = do
  c <- getContents
  let i = takeWhile (/= -1) $ map read $ lines c :: [Double]
      o = map ans i
  mapM_ print o
 

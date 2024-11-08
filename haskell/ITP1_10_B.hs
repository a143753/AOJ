ans :: [Double] -> [Double]
ans (a:b:ac:_) =
  let c = sqrt (a*a + b*b - 2*a*b*cos(2*pi*ac/360.0))
      s = 0.5 * a * b * sin(2*pi*ac/360.0)
      l = a + b + c
      h = 2 * s / a
  in
    (s:l:h:[])

main = do
  l <- getLine
  let i = map read $ words l :: [Double]
      o = ans i
  mapM_ print o

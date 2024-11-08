calc x h =
  let x' = sqrt(2*x*x) / 2.0
      y  = sqrt(x'*x' + h*h)
      y' = sqrt(y*y - x*x/4.0)
  in
    x*x + 4*x*y'/2

ans (0:0:_) = []
ans (x:h:xs) =
  ((calc x h):(ans xs))

main = do
  c <- getContents
  let i = map read $ lines c :: [Double]
      o = ans i
  mapM_ print o
  

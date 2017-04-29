import Text.Printf

inner_product (ax,ay) (bx,by) = ax * bx + ay * by
vabs (ax,ay) = sqrt (ax*ax+ay*ay)
vmul a (ax,ay) = (a*ax,a*ay)
vadd (ax,ay) (bx,by) = (ax+bx,ay+by)

ans ax ay bx by px py =
  let v1 = (bx-ax,by-ay)
      v2 = (px-ax,py-ay)
      ip = inner_product v1 v2
  in
    (ax,ay) `vadd` ( (ip / (vabs v1)**2) `vmul` v1 )
    
main = do
  l0 <- getLine
  getLine
  q0 <- getContents
  let xy@(ax:ay:bx:by:_) = map read $ words l0 :: [Double]
      qs = map (map read) $ map words $ lines q0 :: [[Double]]
      o = map (\ (px:py:_) -> ans ax ay bx by px py) qs
  mapM_ (\(x,y) -> printf "%f %f\n" x y) o
  

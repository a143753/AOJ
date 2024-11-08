inner_product (ax,ay) (bx,by) = ax * bx + ay * by
vabs (ax,ay) = sqrt (ax*ax+ay*ay)
vmul a (ax,ay) = (a*ax,a*ay)
vadd (ax,ay) (bx,by) = (ax+bx,ay+by)
vsub (ax,ay) (bx,by) = (ax-bx,ay-by)

vatan (x,y) = atan2 y x
vnorm (x,y) = x*x+y*y

ans p0 p1 p2 p3 
  | (abs ip) < 0.00000000001 = 1
  | ((abs ip) > 0.99999999999) && ((abs ip) < 1.00000000001) = 2
  | otherwise = 0
--  = ip
  where s1 = vsub p1 p0
        s2 = vsub p3 p2
        ip = (inner_product s1 s2) / (vabs s1) / (vabs s2)

main = do
  getLine
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Double]]
      o = map (\ [xp0,yp0,xp1,yp1,xp2,yp2,xp3,yp3] -> ans (xp0,yp0) (xp1,yp1) (xp2,yp2) (xp3,yp3) ) i
  mapM_ print o

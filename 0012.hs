inner_product (ax,ay) (bx,by) = ax * bx + ay * by
vabs (ax,ay) = sqrt (ax*ax+ay*ay)
vmul a (ax,ay) = (a*ax,a*ay)
vadd (ax,ay) (bx,by) = (ax+bx,ay+by)
vsub (ax,ay) (bx,by) = (ax-bx,ay-by)

vcos a b = (inner_product a b) / (vabs a) / (vabs b)

vatan (x,y) = atan2 y x
vnorm (x,y) = x*x+y*y

ans pa pb pc pp =
  let apb = acos $ vcos (pa `vsub` pp) (pb `vsub` pp)
      bpc = acos $ vcos (pb `vsub` pp) (pc `vsub` pp)
      cpa = acos $ vcos (pc `vsub` pp) (pa `vsub` pp)
  in
    if apb + bpc + cpa >= 1.5*pi
    then "YES"
    else "NO"

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Double]]
      o = map (\ (xp0:yp0:xp1:yp1:xp2:yp2:xp3:yp3:_) -> ans (xp0,yp0) (xp1,yp1) (xp2,yp2) (xp3,yp3) ) i
  mapM_ putStrLn o
  

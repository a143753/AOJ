inner_product (ax,ay) (bx,by) = ax * bx + ay * by
vabs (ax,ay) = sqrt (ax*ax+ay*ay)
vmul a (ax,ay) = (a*ax,a*ay)
vadd (ax,ay) (bx,by) = (ax+bx,ay+by)
vsub (ax,ay) (bx,by) = (ax-bx,ay-by)

vatan (x,y) = atan2 y x
vnorm (x,y) = x*x+y*y

fmod m v
  | v > m = fmod m (v-m)
  | v < 0 = fmod m (v+m)
  | otherwise = v

judge a1 t1 a2 t2
  | a2 == 0  = "ON_SEGMENT"
  | da == 0  = if a2 > a1
               then "ONLINE_FRONT"
               else "ON_SEGMENT"
  | da == pi = "ONLINE_BACK"
  | da <  pi = "COUNTER_CLOCKWISE"
  | otherwise= "CLOCKWISE"
  where
    da = fmod (2*pi) (t2-t1)

ans p0 p1 p2 =
  let v1 = p1 `vsub` p0
      v2 = p2 `vsub` p0
      t1 = vatan v1
      t2 = vatan v2
      a1 = vnorm v1
      a2 = vnorm v2
  in
    judge a1 t1 a2 t2

main = do
  l <- getLine
  getLine
  qs' <- getContents
  let (p0x:p0y:p1x:p1y:_) = map read $ words l :: [Double]
      qs = map (map read) $ map words $ lines qs' :: [[Double]]
      o = map (\ (p2x:p2y:_) -> ans (p0x,p0y) (p1x,p1y) (p2x,p2y) ) qs
  mapM_ putStrLn o

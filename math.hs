-- 数学関数

-- (x1,y1) (x2,y2)の距離
dist x1 y1 x2 y2 = sqrt( (x1-x2)**2 + (y1-y2)**2 )

-- (tx,ty) (sx,sy)を通る直線と(wx,wy)の距離
d2 tx ty sx sy wx wy
  |(sy == ty) && (sx == tx) = 0
  | otherwise = let a = (sy-ty)
                    b = (sx-tx)
                in
                  abs(a*wx - b*wy - a*tx + b*ty) / sqrt(a*a + b*b)

-- (tx,ty) (sx,sy)を通る直線lと(wx,wy)を通りlに垂直な直線の交点
cp tx ty sx sy wx wy =
  let a = (sy-ty)
      b = (sx-tx)
      c = -a*sx + b*sy
      d = -b*wx - a*wy
  in
    ( -(a*c+b*d)/(a*a+b*b), (b*c-a*d)/(a*a+b*b) )

ans :: (Double,Double) -> (Double,Double) -> (Double,Double) -> (Double,Double,Double)
ans (x1,y1) (x2,y2) (x3,y3)
  | x1 == x2 && y1 == y3 = (0,0,0)
  | y1 == y2 && x1 == x3 = (0,0,0)
  | x1 == x2 = (0,0,0)
  | y1 == y2 = (0,0,0)
  | x1 == x3 = (0,0,0)
  | y1 == y3 = (0,0,0)
  | otherwise =
  let
    -- (x1,y1) (x2,y2)を通る直線 l : y = (y2-y1)/(x2-x1)*(x-x1) + y1
    --                               y = (y2-y1)/(x2-x1)*x + y1 - x1*(y2-y1)/(x2-x1)
    --                               y = a2 * x + b2   or x = x1 (x1=x2)
    a2 = (y2-y1)/(x2-x1)
    b2 = y1-x1*(y2-y1)/(x2-x1)
    -- (x1,y1) (x3,y3)を通る直線 m : y = (y3-y1)/(x3-x1)*(x-x3) + y1
    --                               y = a3 * x + b2   or x = x1
    a3 = (y3-y1)/(x3-x1)
    b3 = y1-x1*(y3-y1)/(x3-x1)

    -- lの垂直2等分線 l' : y = -1/a2 * (x-(x1+x2)/2) + (y1+y2)/2
    --                     y = -1/a2 * x + (x1+x2)/2/a2 + (y1+y2)/2
    --                     y = c2 * x + d2 or  y = y2 (y1=y2)
    c2 = -1.0/a2
    d2 = (x1+x2)/2/a2 + (y1+y2)/2
    -- mの垂直2等分線 m' : y = -1/a3 * (x-(x1+x3)/2) + (y1+y3)/2
    --                     y = -1/a3 * x + (x1+x3)/2/a3 + (y1+y3)/2
    --                     y = c3 * x + d3 or  y 
    c3 = -1.0/a3
    d3 = (x1+x3)/2/a3 + (y1+y3)/2

    -- l'とm'の交点 (xp,yp)
    -- yp = c2 * (yp-d3)/c3 + d2
    -- c3*yp = c2*(yp-d3)+c3*d2
    yp = (c3*d2-c2*d3) / (c3-c2)
    xp = (yp - d3) * c3
    r  = 0
  in
    (a3,b3,r)
--    (xp,yp,r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ drop 1 $ lines c :: [[Double]]
      o = map (\(x1:y1:x2:y2:x3:y3:_) -> ans (x1,y1) (x2,y2) (x3,y3)) i

  print o

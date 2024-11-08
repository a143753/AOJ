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

chk' [tx,ty,sx,sy] [wx,wy,r] =
  let dtw = dist tx ty wx wy
      dsw = dist sx sy wx wy
      dwl = d2 tx ty sx sy wx wy
      (_,ycp) = cp tx ty sx sy wx wy
      c1 = (r > dtw) && (r < dsw) 
      c2 = (r < dtw) && (r > dsw) 
      c3 = (dtw > r) && (dsw > r) && (dwl <= r) && (ycp <= maximum[ty,sy]) && (ycp >= minimum[ty,sy])
  in
    c1 || c2 || c3

chk c p =
  if any (chk' p) c
  then "Safe"
  else "Danger"

ans' c d = map (chk c) d

ans ([0]:_) = []
ans ([n]:xs) =
  let c = map (map fromIntegral) $ take n xs :: [[Double]]
      m = head $ head $ drop n xs :: Int
      d = map (map fromIntegral) $ take m $ drop (n+1) xs :: [[Double]]
      r = drop (n+1+m) xs
  in
    (ans' c d):(ans r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = concat $ ans i
  mapM_ putStrLn o

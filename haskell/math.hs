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

-- a*x + b*y + c = 0 と d*x + e*y + f = 0の交点
cpl [a,b,c,d,e,f] =
  let x = (b*f - c*e) / (a*e - b*d) -- aex + bey + ce = 0, bdx + bey + bf = 0
      y = (a*f - c*d) / (b*d - a*e) -- adx + bdy + cd = 0, adx + aey + af = 0
  in
    if (a*e == b*d) || (b*d == a*e)
    then Nothing
    else Just (x,y)

-- 2点 (xa,ya) (xb,yb)を通る直線 ax+by+c=0
ln [xa,ya,xb,yb] =
  let a =  ya - yb
      b = -xa + xb
      c = (-ya+yb)*xa + (xa-xb)*ya
  in
    [a,b,c]

-- 直線ABと直線CDの交点
cp4 [xa,ya,xb,yb,xc,yc,xd,yd] =
  let lab = ln [xa,ya,xb,yb]
      lcd = ln [xc,yc,xd,yd]
  in
    cpl (lab ++ lcd)

-- 線分ACと線分BDが交点を持つか判定する
ans [xa,ya,xb,yb,xc,yc,xd,yd] =
  let cross = cp4 [xa,ya,xc,yc,xb,yb,xd,yd] 
      [xo,xp] = sort [xa,xc]
      [xq,xr] = sort [xb,xd]
      [yo,yp] = sort [ya,yc]
      [yq,yr] = sort [yb,yd]
  in
    case cross of
      Nothing      -> "NO"
      Just (xx,yx) -> if (xo <= xx ) && (xx <= xp) && (xq <= xx) && (xx <= xr) &&
                         (yo <= yx ) && (yx <= yp) && (yq <= yx) && (yx <= yr)
                      then "YES"
                      else "NO"

-- 組み合わせ
combinations :: Int -> [a] -> [[a]]
combinations n xs = comb n xs [] [] where
  comb 0 _      ys zs = reverse ys : zs
  comb _ []     _  zs = zs
  comb n (x:xs) ys zs = comb (n - 1) xs (x:ys) (comb n xs ys zs)

-- powMod, combのmodで使う素数
p :: Mod
p = 998244353

-- べき乗計算(mod p)
powMod :: Mod -> Mod -> Mod
powMod x n = go x n 1
  where
    go _ 0 acc = acc
    go a b acc
      | odd b     = go (a * a `mod` p) (b `div` 2) (acc * a `mod` p)
      | otherwise = go (a * a `mod` p) (b `div` 2) acc

-- 組み合わせ計算。階乗計算を都度行なう版
comb :: Mod -> Mod -> Mod
comb n k0
  | k0 < 0 || k0 > n = 0
  | otherwise =
      numerator * powMod denominator (p - 2) `mod` p
  where
    k = min k0 (n - k0)
    numerator =
      foldl
        (\acc i -> acc * ((n - i + 1) `mod` p) `mod` p)
        1
        [1 .. k]
    denominator =
      foldl
        (\acc i -> acc * i `mod` p)
        1
        [1 .. k]

prep :: Int -> ([Mod],[Mod])
prep n = (fact,ifact)
  where
    fact  = map (\k -> foldl'
                       (\acc i -> acc * fromIntegral(i) `mod` p)
                       (1::Mod)
                       [1 .. k]
                ) [0..n] 
    ifact = map (\k -> powMod k (p - 2) `mod` p) fact

-- 組み合わせ計算。階乗計算でtableを参照する版
comb' :: ([Mod],[Mod]) -> Mod -> Mod -> Mod
comb' (fact,ifact) n k0
  | k0 < 0 || k0 > n = 0
  | otherwise =
      ( numer1 * denom1 `mod` p ) * denom2 `mod` p
  where
    k = min k0 (n - k0)
    numer1 = fact!!(fromIntegral n)
    denom1 = ifact!!(fromIntegral k) 
    denom2 = ifact!!(fromIntegral (n-k))

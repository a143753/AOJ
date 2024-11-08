cnv [m,r,f] =
  let m' = read m :: Int
      r' = read r :: Double
      r''= toRational r'
      f' = read f :: Int
  in
    (m',r'',f')

interest t r = floor( r * (fromIntegral t) ) 

cal (0, r, f) t 0 = t
cal (0, r, f) t y =
  let i = interest t r
      t'= t - f
  in
    i + cal (0, r, f) t' (y-1)

cal (1, r, f) t 0 = t
cal (1, r, f) t y =
  let i = interest t r
      t'= t + i - f
  in
    cal (1, r, f) t' (y-1)

ans [] = []
ans x =
  let [t,y,n] = map read $ take 3 x :: [Int]
      d = map (cnv . words) $ take n $ drop 3 x
      a = maximum $ map (\c -> cal c t y) d
      r = drop (n+3) x
  in
    a:(ans r)

main = do
  _ <- getLine
  c <- getContents
  let i = lines c
      o = ans i
  mapM_ print o

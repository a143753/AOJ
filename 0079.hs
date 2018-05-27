splitBy :: Char -> String -> [String]
splitBy _ [] = []
splitBy a x =
  let s = takeWhile (/= a) x
      x'= dropWhile (/= a) x
  in
    if x' == []
    then [s]
    else s:(splitBy a $ drop 1 x')

dist :: [Double] -> [Double] -> Double
dist [x0,y0] [x1,y1] = sqrt( (x1-x0)**2 + (y1-y0)**2 )

ans' :: [Double] -> [[Double]] -> Double
ans' p []     = 0
ans' p (q:[]) = 0

ans' p (q:r:s) =
  let a = dist p q
      b = dist q r
      c = dist p r
      z = (a+b+c) / 2
      w = sqrt( z * (z - a) * (z - b) * (z - c) )
  in
    w + (ans' p (r:s))

ans :: [[Double]] -> Double
ans (a:d) = ans' a d
  
main = do
  c <- getContents
  let i = map (map read) $ map (splitBy ',') $ lines c :: [[Double]]
      o = ans i
  print o

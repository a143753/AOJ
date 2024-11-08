import Data.List

ans' :: (Double,Double) -> Double -> [Double] -> (Double,Double)
ans' (c0,p0) _ [] = (c0,p0)
ans' (c0,p0) p1 (x:xs) =
  if (x/p1) > (c0/p0)
  then ans' (c0+x,p0+p1) p1 xs
  else (c0,p0)

ans :: [String] -> Int
ans (_:p:c:l) =
  let [p0,p1] = map read $ words p :: [Double]
      c0 = read c :: Double
      (ca,pa) = ans' (c0,p0) p1 $ reverse $ sort $ map read l :: (Double,Double)
  in
    floor (ca / pa)

main = do
  c <- getContents
  let o = ans $ lines c
  print o
  

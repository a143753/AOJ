-- Simultaneous Equation
-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0004

import Text.Printf

rnd x = (fromIntegral $ round $ x * 1000) / 1000

-- ax+by=c
-- dx+ey=f
-- ->
-- ax+b(f-dx)/e=c  -> (ae-bd)x=ce-bf
ans :: (Double,Double,Double) -> (Double,Double,Double) -> (Double,Double)
ans (a,b,c) (d,e,f) =
    let x = (c*e-b*f) / (a*e-b*d)
        y = (c-a*x) / b
        x' = rnd x
        y' = rnd y
    in
      (x',y')

main = do
  c <- getContents
  let t = map (map read) $ map words $ lines c :: [[Double]]
      i = map (\(a:b:c:d:e:f:xs) -> [(a,b,c), (d,e,f)]) t
      o = map (\(f1:f2:fs) -> ans f1 f2) i
  mapM_ (\(x,y) -> printf "%.3f %.3f\n" x y) o

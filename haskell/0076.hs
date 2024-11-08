ans' :: Int -> (Double,Double) -> (Double,Double)
ans' 0 (x,y) = (x,y)
ans' n (x,y) =
  let r = sqrt(x*x+y*y)
      dx= y / r
      dy= x / r

      x'= x - dx
      y'= y + dy
  in
    ans' (n-1) (x',y') 

ans :: [Int] -> [Double]
ans [] = []
ans (-1:_) = []
ans (n:ns) =
  let (x,y) = ans' (n-1) (1,0)
  in
    (x:y:ans ns)
  
main = do
  c <- getContents
  let i = takeWhile (/= -1) $ map read $ lines c :: [Int]
      o = ans i
  mapM_ print o

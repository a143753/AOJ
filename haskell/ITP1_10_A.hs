import Text.Printf

ans :: (Double,Double) -> (Double,Double) -> Double
ans (x1,y1) (x2,y2) = sqrt ( (x1-x2)^2 + (y1-y2)^2 )

main = do
  l <- getLine
  let (x1:y1:x2:y2:_) = map read $ words l :: [Double]
      o = ans (x1,y1) (x2,y2)
  printf "%.8f\n" o

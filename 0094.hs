import Text.Printf

tsubo = 3.305785

ans :: Double -> Double -> Double
ans x y = x * y / tsubo

main = do
  l <- getLine
  let i = map read $ words l :: [Double]
      o = ans (i!!0) (i!!1)
  printf "%.6f\n" o
  

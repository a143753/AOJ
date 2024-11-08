ans :: Double -> Int
ans v =
  let y = v * v / 9.8 / 9.8 * 4.9
  in
    ceiling $ (y + 5) / 5
  
main = do
  c <- getContents
  let i = map read $ lines c :: [Double]
      o = map ans i
  mapM_ print o

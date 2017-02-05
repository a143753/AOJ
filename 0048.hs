ans :: Double -> String
ans x
  | x <= 48.0 = "light fly"
  | x <= 51.0 = "fly"
  | x <= 54.0 = "bantam"
  | x <= 57.0 = "feather"
  | x <= 60.0 = "light"
  | x <= 64.0 = "light welter"
  | x <= 69.0 = "welter"
  | x <= 75.0 = "light middle"
  | x <= 81.0 = "middle"
  | x <= 91.0 = "light heavy"
  | otherwise = "heavy"

main = do
  c <- getContents
  let i = map read $ lines c :: [Double]
      o = map ans i
  mapM_ putStrLn o

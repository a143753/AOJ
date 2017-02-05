ans :: [Int] -> String
ans [] = []
ans (m:f:r:_)
  | (m==(-1)) || (f==(-1)) = "F"
  | (m+f) >= 80            = "A"
  | (m+f) >= 65            = "B"
  | (m+f) >= 50            = "C"
  | (m+f) >= 30 && (r>=50) = "C"
  | (m+f) >= 30            = "D"
  | otherwise              = "F"

main = do
  c <- getContents
  let i  = map (map read) $ map words $ lines c :: [[Int]]
      i' = takeWhile (/= [-1,-1,-1]) i
      o  = map ans i'
  mapM_ putStrLn o

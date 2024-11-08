th = 0.00001

ans :: [Float] -> String
ans (x1:y1:x2:y2:x3:y3:x4:y4:_)
  | y2 == y1  = if y4 == y3 then "YES" else "NO"
  | x4 == x3  = if x2 == x1 then "YES" else "NO"
  | otherwise = if (y2-y1) / (x2-x1) == (y4-y3) / (x4-x3)
                then "YES"
                else "NO"

main = do
  c <- getContents
  let i = map (map read) $ map words $ drop 1 $ lines c :: [[Float]]
      o = map ans i
  mapM_ putStrLn o

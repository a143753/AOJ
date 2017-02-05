ans :: [Int] -> String
ans (w:h:x:y:r:s)
  | (x-r>=0) && (y-r>=0) && (x+r<=w) && (y+r<=h) = "Yes"
  | otherwise = "No"

main = do
  l <- getLine
  let i = map read $ words l
      a = ans i
  putStrLn a

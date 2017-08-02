ans :: [Int] -> String
ans (0:y:_)
  | y <= 1911 = "M" ++ show(y-1867)
  | y <= 1925 = "T" ++ show(y-1911)
  | y <= 1988 = "S" ++ show(y-1925)
  | otherwise = "H" ++ show(y-1988)

ans (1:y:_) = show(y + 1867)
ans (2:y:_) = show(y + 1911)
ans (3:y:_) = show(y + 1925)
ans (4:y:_) = show(y + 1988)

main = do
  c <- getLine
  let i = map read $ words c :: [Int]
      o = ans i
  putStrLn o
  

fee n
  | n > 30 = 160 * (n-30) + 140 * 10 + 125 * 10 + 1150
  | n > 20 = 140 * (n-20) + 125 * 10 + 1150
  | n > 10 = 125 * (n-10) + 1150
  | otherwise = 1150

ans n =
  let f = fee n
  in
    4280 - f

main = do
  c <- getContents
  let i = takeWhile (/= -1) $ map read $ lines c :: [Int]
      o = map ans i
  mapM_ print o

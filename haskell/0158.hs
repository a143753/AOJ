ans i 1 = i
ans i n =
  if (n `mod` 2) == 0
  then ans (i+1) (n `div` 2)
  else ans (i+1) (n*3 + 1)

main = do
  c <- getContents
  let i = takeWhile (/= 0) $ map read $ lines c :: [Int]
      o = map (ans 0) i
  mapM_ print o

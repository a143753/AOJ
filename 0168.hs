f 0 = 1
f 1 = 1
f 2 = 2
f n = f (n-1) + f (n-2) + f (n-3)

ans i =
  let d = f i
      y = d `div` (365*10)
      m = d `mod` (365*10)
  in
    if m == 0
    then y
    else y+1

main = do
  c <- getContents
  let i = takeWhile (/= 0) $ map read $ lines c :: [Int]
      o = map ans i
  mapM_ print o

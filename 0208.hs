judge :: Int -> Bool
judge 0 = True
judge n =
  let r = n `mod` 10
  in
    if r == 4 || r == 6
    then False
    else judge $ n `div` 10

numbers = filter judge [1..]

ans n = numbers!!(n-1)

main = do
  c <- getContents
  let i = takeWhile (/= 0) $ map read $ lines c :: [Int]
      o = map ans i

  mapM_ print o

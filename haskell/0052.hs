cntz 0 = 0
cntz x =
  if x `mod` 10 == 0
  then 1 + (cntz $ x `div` 10)
  else 0

ans' x =
  let p = product [1..x]
  in 
    cntz p

main = do
  c <- getContents
  let i = takeWhile (/= 0) $ map read $ lines c :: [Integer]
      o = map ans' i
  mapM_ print o

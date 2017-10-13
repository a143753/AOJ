coins = [500,100,50,10,5,1]

ans' [] _ = 0

ans' (c:cs) n =
  let d = n `div` c 
      m = n `mod` c
  in
    d + (ans' cs m)

ans n =
  let r = 1000 - n
  in
    ans' coins r 

main = do
  c <- getContents
  let i = takeWhile (/= 0) $ map read $ lines c :: [Int]
      o = map ans i
  mapM_ print o

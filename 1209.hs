coins = reverse $ map (\i -> i*i) [1..17]

ans :: [Int] -> Int -> Int
ans _ 0 = 1
ans [1] n = 1
ans (c:cs) v =
  let a = v `div` c
      s = [0 .. a]
  in
    sum $ map (\n -> ans cs (v - c*n)) s

main = do
  c <- getContents
  let i = takeWhile (/= 0) $ map read $ lines c
      o = map (ans coins) i
  mapM_ print o
  

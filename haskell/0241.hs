ans [x1,y1,z1,w1,x2,y2,z2,w2] =
  let x = x1*x2 - y1*y2 - z1*z2 - w1*w2
      y = y1*x2 + x1*y2 - w1*z2 + z1*w2
      z = z1*x2 + w1*y2 + x1*z2 - y1*w2
      w = w1*x2 - z1*y2 + y1*z2 + x1*w2
  in
    [x,y,z,w]

ans' :: [[Int]] -> [[Int]]
ans' ([0]:x) = []
ans' ([n]:x) = 
  let a = map ans $ take n x
      y = drop n x
  in
    a ++ (ans' y)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans' i
  mapM_ putStrLn $ map unwords $ map (map show) o

mil = [1000,1,1]

y2d :: Int -> Int
y2d y =
  let y3 = y `div` 3
      y12= y - y3
  in
    y3 * 10 * 20 + y12 * (5 * 19 + 5 * 20)

m2d :: Int -> Int -> Int
m2d y m =
  if (y`mod`3) == 0
  then m * 20
  else (m`div`2) * 39 + (m`mod`2) * 20

days :: [Int] -> Int
days [y,m,d] =
  let yd = y2d (y - 1)
      md = m2d y (m - 1)
      dd = d - 1
  in
    yd+md+dd
  

ans x@[y,m,d] =
  let i = days x
      j = days mil
  in
    j - i

main = do
  _ <- getLine
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = map ans i
  mapM_ print o

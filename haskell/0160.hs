size x y h = x + y + h

fee (x:y:h:w:_)
  | (size x y h) <=  60 && w <=  2 =  600
  | (size x y h) <=  80 && w <=  5 =  800
  | (size x y h) <= 100 && w <= 10 = 1000
  | (size x y h) <= 120 && w <= 15 = 1200
  | (size x y h) <= 140 && w <= 20 = 1400
  | (size x y h) <= 160 && w <= 25 = 1600
  | otherwise  = 0

ans' d = sum $ map fee d

ans ([0]:_) = []
ans ([n]:x) =
  let d = take n x
      r = drop n x
  in
    (ans' d):(ans r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o

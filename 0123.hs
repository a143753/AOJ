t2s m s d = m * 60 + s + d / 100.0

ans (t1:t2:_)
  | (t1 < (t2s 0 35 50)) && (t2 < (t2s 1 11 00)) = "AAA"
  | (t1 < (t2s 0 37 50)) && (t2 < (t2s 1 17 00)) = "AA"
  | (t1 < (t2s 0 40 00)) && (t2 < (t2s 1 23 00)) = "A"
  | (t1 < (t2s 0 43 00)) && (t2 < (t2s 1 29 00)) = "B"
  | (t1 < (t2s 0 50 00)) && (t2 < (t2s 1 45 00)) = "C"
  | (t1 < (t2s 0 55 00)) && (t2 < (t2s 1 56 00)) = "D"
  | (t1 < (t2s 1 10 00)) && (t2 < (t2s 2 28 00)) = "E"
  | otherwise = "NA"

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Float]]
      o = map ans i
  mapM_ putStrLn o

ans n (a:b:_)
  -- 左上の三角形にくるように座標変換する
  | b <= a     = ((b-1) `mod` 3) + 1
  | b <= (n-a) = ((a-1) `mod` 3) + 1
  | otherwise  = ((n-b) `mod` 3) + 1

main = do
  n <- getLine
  k <- getLine
  c <- getContents
  let n' = read n :: Int
      k' = read k :: Int
      c' = map (map read) $ map words $ lines c :: [[Int]]
      o  = map (ans n') c'
  mapM_ print o
  

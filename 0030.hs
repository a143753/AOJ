-- 項数 合計 最大
ans' :: Int -> Int -> Int -> Int
ans' 1 0 _    = 1
ans' s 0 _    = 0
ans' 0 s _
  | s == 0    = 1
  | otherwise = 0
ans' 1 s m
  | m >= s    = 1
  | otherwise = 0
ans' n s m =
  let ms = [0..m]
      mp = map (\i -> ans' (n-1) (s-i) i ) ms
  in
    sum mp

ans :: [Int] -> [Int]
ans (n:s:_) =
  let ms = [1..s]
      mp = map (\i -> ans' (n-1) (s-i) i ) ms
  in
    mp

main = do
  c <- getContents
  let i' = map (map read) $ map words $ lines c :: [[Int]]
      i  = takeWhile (/= [0,0]) i'
      o  = map ans i
  print $ ans' 2 5 1
  print $ ans' 2 4 2
  print $ ans' 2 3 3
  print $ ans' 2 2 4
  print $ ans' 2 1 5
  print $ ans' 2 0 6
  mapM_ print o

combinations :: Int -> [a] -> [[a]]
combinations n xs = comb n (length xs) xs where
  comb 0 _ _ = [[]]
  comb r n a@(x:xs)
    | n == r    = [a]
    | otherwise = map (x:) (comb (r - 1) (n - 1) xs) ++ comb r (n - 1) xs

ans' n t s =
  let c = combinations t n
      o = filter (\e -> sum e == s) c
  in
    length o

ans (t:s:_) =
  let n = [0..9]
  in 
    if s < ( sum $ take t n )
    then 0
    else if s > (sum $ take t $ reverse n)
         then 0
         else ans' n t s

main = do
  c <- getContents
  let i' = map (map read) $ map words $ lines c :: [[Int]]
      i  = takeWhile (/= [0,0]) i'
      o  = map ans i
  mapM_ print o

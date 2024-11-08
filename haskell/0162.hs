f x y z = 5^x * 3^y * 2^z

ans2 v5 v3 m n =
  let max = floor $ logBase 2.0 ( fromIntegral(n) / (5.0^v5) / (3.0^v3) )
      res = filter (\v2 -> (f v5 v3 v2) >= m && (f v5 v3 v2) <= n) [0..max]
      ans = map (\v2 -> (v5,v3,v2)) res
  in
    length(res)

ans3 v5 m n =
  let max = floor $ logBase 3.0 ( fromIntegral(n) /  (5.0^v5) )
      res = map (\v3 -> ans2 v5 v3 m n) [0..max]
  in
    sum res

ans5 (m:n:_) =
  let max = floor $ logBase 5.0 (fromIntegral n)
      res = map (\v5 -> ans3 v5 m n) [0..max]
  in
    sum $ res

main = do
  c <- getContents
  let i = takeWhile (/= [0]) $ map (map read) $ map words $ lines c :: [[Int]]
      o = map ans5 i
  mapM_ print o

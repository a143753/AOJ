pfact2 :: Integral a => a -> [a]
pfact2 n = sub n 2
  where
    sub n p
      | n == 1 = []
      | n `mod` p == 0 = p : sub (n `div` p) p
      | otherwise = sub n (p + 1)

pack :: Eq a => [a] -> [(a, Int)]
pack [] = []
pack (x:xs) = (x, 1 + (length $ takeWhile (== x) xs)) : pack (dropWhile (== x) xs)

ans [a,b] =
  let pa@(ha:ra) = reverse $ map fst $ pack $ pfact2 a
      ka = ha - (sum ra)
      pb@(hb:rb) = reverse $ map fst $ pack $ pfact2 b
      kb = hb - (sum rb)
  in
    if ka > kb
    then "a"
    else "b"

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
  let o = map ans $ takeWhile (\ x -> x /= [0,0]) i
  mapM_ putStrLn  o

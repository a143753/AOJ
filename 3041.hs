ans' q _ [] = q
ans' q a (d:ds) =
  case d of
    [0,k] -> ans' ((a!!(k-1)):q) a ds
    [1,k] -> ans' q (swp a k) ds
  where
    swp a k = (drop k a) ++ (take k a)

ans x =
  let [n,_] = head x
      a = take n [1..]
      d = tail x
  in
    ans' [] a d

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print $ reverse o

-- time limit exceeded

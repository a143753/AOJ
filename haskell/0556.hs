cnv0 n x =
  if x' >= n' then n - x else x'
  where
    x' = x - 1
    n' = if n `mod` 2 == 0 then n `div` 2 else (n+1) `div` 2

cnv1 (x,y) = if y > x then (y,x) else (x,y)
  

ans n (a:b:_) = 
  let a' = cnv0 n a
      b' = cnv0 n b
      (a'',b'') = cnv1 (a',b')
  in
    (b'' `mod` 3) + 1

main = do
  n <- getLine
  k <- getLine
  c <- getContents
  let n' = read n :: Int
      k' = read k :: Int
      c' = map (map read) $ map words $ lines c :: [[Int]]
      o  = map (ans n') c'
  mapM_ print o
  

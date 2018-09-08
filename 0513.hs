merge [] [] = []
merge (x:xs) (y:ys) = (x:y:(merge xs ys))

riffle c =
  let n = (length c) `div` 2
      h = take n c
      t = drop n c
  in
    merge h t

cut k c =
  let h = take k c
      t = drop k c
  in
    t ++ h

ans' c [] = c
ans' c (k:ks) =
  let c' = if k == 0 then (riffle c) else (cut k c)
  in
    ans' c' ks

ans (n:m:x) =
  let c = [1..(2*n)]
      a = ans' c $ take m x
  in
    a

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = ans i
  mapM_ print o

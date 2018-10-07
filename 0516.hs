msum k l s x x' =
  if l >= k
  then  s `seq` x `seq` s:(msum k (l-1) s' (tail x) (tail x'))
  else []
  where
    s' = (s - (head x) + (head x'))

ans' n k x =
  let s = sum $ take k x
      x'= drop k x
      y = msum k n s x x'
  in
    maximum y

ans (l:ls) =
  if n == 0 && k == 0
  then []
  else (ans' n k x):(ans r)
  where
    [n,k] = map read $ words l :: [Int]
    x = map read $ take n ls :: [Int]
    r = drop n ls

main = do
  c <- getContents
  let i = lines c
      o = ans i
  mapM_ print o

rs c [] [] x = x
rs c a b x =
  if c > length a
  then rs c b [] (x++a)
  else rs c b (drop c a) (x++(take c a))

rshuf [] x = x
rshuf (c:cs) x =
  let l = length x
      n = (l `div` 2)
      f = drop n x
      b = take n x
      r = rs c f b []
  in
    rshuf cs r
    
ans [] = []
ans ((n:_):cs:xs) =
  let s = last $ rshuf cs [0..(n-1)]
  in 
    s:(ans xs)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o

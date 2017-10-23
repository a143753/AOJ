import Data.List

ans' :: Int -> [Int] -> Int -> Int
ans' 1 n s =
  if elem s n 
  then 1
  else 0
  
ans' n num s =
  let max' = maximum num
      min' = minimum num
      smax = max' * ( div ( (n+1) * n ) 2 )
      smin = min' * ( div ( (n+1) * n ) 2 )
      num' = filter (\x -> s > x * n) num
  in
    -- Wrong Anser
--    if s > smax || s < smin
    if s < smin -- sminだけだとTLE、smaxの論理を入れるとWA
    then 0
    else if num' == []
         then 0
         else sum $ map (\v -> ans' (n-1) (delete v num) (s - n*v) ) num'

    -- Time Limit Exceeded
    -- if num' == []
    -- then 0
    -- else sum $ map (\v -> ans' (n-1) (delete v num) (s - n*v) ) num'

ans [n,s] =
  ans' n [0..9] s

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c
      o = map ans i
  mapM_ print o
  

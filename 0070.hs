import Data.List

ans' :: Int -> [Int] -> Int -> Int
ans' 1 n s =
  if elem s n 
  then 1
  else 0
  
ans' n num s =
  let num' = filter (\x -> s > x * n) num
  in
    if num' == []
    then 0
    else sum $ map (\v -> ans' (n-1) (delete v num) (s - n*v) ) num'

ans [n,s] =
  ans' n [0..9] s

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c
      o = map ans i
  mapM_ print o
  

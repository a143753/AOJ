play' :: Int -> [Int] -> [Int]
play' k (s1:[]) = [s1]
play' k (s1:s2:ss) =
  if (s1 `mod` k) > (s2 `mod` k)
  then s2:play' k (s1:ss)
  else s1:play' k (s2:ss)

play [] zk = zk
play (m:ms) zk =
  let zk' = play' m zk
  in
    play ms zk'

main = do
  nm <- getLine
  zk <- getContents
  let [n,m] = map read $ words nm :: [Int]
      zk' = map read $ lines zk :: [Int]
      o = play [2..m] zk'
  mapM_ print o
  

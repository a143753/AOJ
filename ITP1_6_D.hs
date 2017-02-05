mul [] [] = 0
mul (m:ms) (v:vs) = (m*v) + mul ms vs

mult :: [[Int]] -> [Int] -> [Int]
mult [] _ = []
mult (m:ms) v =
  (mul m v):(mult ms v)

main = do
  c <- getContents
  let c' = map (map read) $ map words $ lines c :: [[Int]]
      (m:n:_) = c'!!0
      matrix = take m $ drop 1 c'
      vector = concat $ take n $ drop (1+m) c'
      result = mult matrix vector
--  print matrix
--  print vector
  mapM_ print result
  
  

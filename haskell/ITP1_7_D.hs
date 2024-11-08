mul [] [] = 0
mul (m:ms) (v:vs) = (m*v) + mul ms vs

mult :: [[Int]] -> [[Int]] -> [[Int]]
mult [] _ = []
mult a b =
  let t = transpose b
  in 
    map (\a0 -> map (mul a0) t) a

transpose :: [[Int]] -> [[Int]]
transpose ([]:_) = []
transpose matrix =
  let row  = map (head) matrix
      rows = transpose $ map (drop 1) matrix
  in
    row:rows

to_str :: [Int] -> String
to_str [] = []
to_str (x:[]) = show x
to_str (x:xs) =
  (show x)++(' ':(to_str xs))

main = do
  c <- getContents
  let c' = map (map read) $ map words $ lines c :: [[Int]]
      (m:n:l:_) = c'!!0
      mat1 = take m $ drop 1 c'
      mat2 = take n $ drop (1+m) c'
      res  = mult mat1 mat2
  mapM_ putStrLn $ map to_str res
  
  

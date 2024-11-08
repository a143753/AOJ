import Data.Char

transpose ([]:_) = []
transpose matrix =
  let row  = map (head) matrix
      rows = transpose $ map (drop 1) matrix
  in
    row:rows

patch :: [[Int]] -> [Int] -> [[Int]]
patch b [x, y] =
  let b0 = take (x-1) b
      c  = head $ drop (x-1) b
      b1 = drop x b
      c0 = take (y-1) c
      d  = 1 - (head $ drop (y-1) c)
      c1 = drop y c
  in
    b0 ++ ((c0++(d:c1)):b1)

chk' b =
  let n = (length b) `div` 2
      x = take n b
      y = take n $ reverse b
  in
    x == y

chk b = (chk' b) && (chk' b')
  where b' = transpose b

ans' b [] = []
ans' b ([d]:ds) =
  let df = take d ds
      r  = drop d ds
      b' = foldl patch b df
      c  = chk b'
  in
    c:(ans' b' r)

ans i =
  let l = lines i
      [c,n] = map read $ words $ head l :: [Int]
      b = map (map digitToInt) $ take n $ drop 1 l :: [[Int]]
      d = map (map read) $ map words $ drop (n+1) l :: [[Int]]
  in
    (chk b):(ans' b d)

main = do
  i <- getContents
  let o = ans i
  print $ length $ filter (\e -> e) o

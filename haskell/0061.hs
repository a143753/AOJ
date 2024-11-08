import Data.List

split' [] = []
split' (',':xs) = split' xs
split' x =
  let w = takeWhile (/= ',') x
      z = dropWhile (/= ',') x
  in
    w:(split' z)

numbering :: Int -> Int -> [(Int,Int)] -> [(Int,Int,Int)]
numbering _ _ [] = []
numbering n p ((i,s):xs) =
  if p == s
  then (i,s,n):(numbering n p xs)
  else (i,s,n+1):(numbering (n+1) s xs)

mkdb x =
  let s = sortBy (\(x0,x1) (y0,y1) -> compare y1 x1) x
      (_,p) = s!!0
      n = numbering 1 p s
  in
    n

lookup' :: Int -> [(Int,Int,Int)] -> Int
lookup' n ((i,s,o):xs) =
  if n == i
  then o
  else lookup' n xs

main = do
  c <- getContents
  let l = lines c
      t = map (map read) $ map split' $ takeWhile (/= "0,0") l :: [[Int]]
      t'= map (\ [x,y] -> (x,y)) t :: [(Int,Int)]
      q = map read $ drop 1 $ dropWhile (/= "0,0") l :: [Int]
      d = mkdb t'
      o = map (\ i -> lookup' i d) q
--  print t'
--  print q
--  print d
  mapM_ print o

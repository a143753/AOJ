splitBy :: Char -> String -> [String]
splitBy _ [] = []
splitBy a x =
  let s = takeWhile (/= a) x
      x'= dropWhile (/= a) x
  in
    if x' == []
    then [s]
    else s:(splitBy a $ drop 1 x')

metric :: [Int] -> [Int] -> [Int]
metric _ [] = []
metric (m0:m1:ms) (x:xs) = (x + max m0 m1):(metric (m1:ms) xs)

ans' m [] = m
ans' m (x:xs) =
  let lm = length m
      lx = length x
      m' = if lm < lx
           then metric ((0:m)++[0]) x
           else metric m x
  in
    ans' m' xs

ans (x:xs) = head $ ans' x xs

main = do
  c <- getContents
  let i = map (map read) $ map (splitBy ',') $ lines c :: [[Int]]
      o = ans i
  print o
  

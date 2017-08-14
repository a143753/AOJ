import Data.List

sum' [] = 0
sum' (m:s:r) = m*60 + s + sum' r

ans' :: [[Int]] -> [Int]
ans' x =
  let x' = map (\ (a:s) -> (a,sum' s) ) x
      s  = sortBy (\ (a,b) (c,d) -> compare b d) x'
      l  = length s
  in
    [ fst $ (s!!0), fst $ (s!!1), fst (s!!(l-2)) ]

ans ([0]:_) = []
ans ([n]:x) =
  let i = take n x
      y = drop n x
  in
    (ans' i)++(ans y)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o

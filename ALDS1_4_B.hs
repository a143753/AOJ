import Data.List

nub' :: [Int] -> [Int]
nub' [] = []
nub' (x:[]) = [x]
nub' (x0:x1:xs) =
  if x0 == x1
  then nub' (x1:xs)
  else x0:(nub' (x1:xs))

ans' [] _ = []
ans' _ [] = []
ans' (s:ss) (q:qs) =
  if s == q
  then s:(ans' ss qs)
  else
    if s > q
    then ans' (s:ss) qs
    else ans' ss (q:qs)

ans s q =
  let s' = nub' $ sort s
      q' = nub' $ sort q
  in
    length $ ans' q' s'

main = do
  getLine
  s' <- getLine
  getLine
  q' <- getLine
  let s = map read $ words s' :: [Int]
      q = map read $ words q' :: [Int]
      o = ans s q
  print o

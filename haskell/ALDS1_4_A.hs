import Data.List
ans s q = length $ nub $ intersect s q

main = do
  getLine
  s' <- getLine
  getLine
  q' <- getLine
  let s = map read $ words s' :: [Int]
      q = map read $ words q' :: [Int]
      o = ans s q
  print o

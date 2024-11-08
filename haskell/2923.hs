import Data.List
-- time limit exceeded
cmp a b = compare a' b'
  where
    a' = head a
    b' = head b

ans' l m [] = m
ans' l m s@([a,b]:ss) =
  let m' = length $ filter (\[c,d] -> d >= a) s
      m''= maximum [m,m']
      l' = l - 1
  in
    if m'' > l'
    then m''
    else ans' l' m'' ss

ans c = ans' l 0 s
  where
    s = reverse $ sortBy cmp c
    l = length s

main = do
  n <- getLine
  c <- getContents
  let n' = read n :: Int
      c' = map (map read) $ map words $ lines c :: [[Int]]
      o  = ans c'
  print o

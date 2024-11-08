import Data.List

dup [] = []
dup ([a,b]:x) = ([a,b]:[b,a]:(dup x))

mkt [] = []
mkt ([a,b]:x) =
  let l = map (\c -> c!!1) $ takeWhile (\ [a0,b0] -> a == a0 ) x
      r = dropWhile (\ [a0,b0] -> a == a0) x
  in
    (a,(b:l)):(mkt r)

get_val b = case b of
              Just b' -> b'
              Nothing -> []

ans' t l = concat $ map (\ a -> get_val $ lookup a t ) l

ans ([0]:[0]:_) = []
ans ([n]:[m]:x) =
  let s = sortBy (\[a0,a1] [b0,b1] -> compare a0 b0) $ dup $ take m x
      r = drop m x
      t = mkt s
      a1= ans' t [1]
      a2= ans' t a1
      a = (nub $ sort (a1++a2)) \\ [1]
      l = length a
  in
    l:(ans r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o


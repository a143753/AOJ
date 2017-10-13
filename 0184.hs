import Data.Array.Unboxed

cls a
  | a < 60    = a `div` 10
  | otherwise = 6

cns :: UArray Int Int -> [Int] -> UArray Int Int
cns ary [] = ary
cns ary (d:ds) =
  let c = cls d
      a'= ary // [(c,(ary!c)+1)]
  in
    cns a' ds

ans' d =
  let ary = array (0,6) [(i,0)|i <- [0..6]]
      tbl = cns ary d
  in
    map (\i-> (tbl!i)) [0..6]

ans (0:_) = []
ans (n:x) =
  let d = take n x
      r = drop n x
  in
    (ans' d)++(ans r)
  
main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = ans i
  mapM_ print o
  

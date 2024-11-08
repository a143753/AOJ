import Data.List

cap = [4, 1, 4, 1, 2, 1, 2, 1]

rot :: [Int] -> Int -> [Int]
rot v n =
  let f = take n v
      r = drop n v
  in
    r ++ f

cal [] [] = 0
cal (c:cs) (v:vs) =
  let n = if c < v
          then 0
          else c - v
  in
    n + (cal cs vs)

to_i' (v:[]) = v
to_i' (v:vs) = (to_i' vs) * 10 + v

to_i v = to_i' $ reverse v

ans v =
  let r = zip [0..7] $ map (cal v) $ map (rot cap) [0..7]
      (i,_) = minimumBy (\ (n0,v0) (n1,v1) -> let c0 = compare v0 v1
                                                  i0 = to_i $ rot cap n0
                                                  i1 = to_i $ rot cap n1
                                                  c1 = compare i0 i1
                                              in
                                                if c0 /= EQ
                                                then c0
                                                else c1 ) r
  in
    rot cap i

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = map ans i
  mapM_ putStrLn $ map unwords $ map (map show) o

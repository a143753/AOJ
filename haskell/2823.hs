import Data.List

f x@([d,v]:_) =
  sum $ g $ sortBy s x
  where
    s [a0,a1] [b0,b1] =
      let c0 = compare a0 b0
          c1 = compare b1 a1
      in
        if c0 /= EQ then c0 else c1
    g [] = []
    g ([d,v]:x) =
      let r = dropWhile (\ [d',v'] -> d == d' ) x
      in
        v:(g r)
        

ans ([0,0]:_) = []
ans ([n,m]:x) =
  let d = take n x
      r = drop n x
      a = f d
  in
    a:(ans r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o
      

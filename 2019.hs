import Data.List

f _ [] = []
f m ([d,p]:r) =
  if m >= d
  then f (m-d) r
  else [d-m,p]:r

ans' m dp =
  let s = f m $ sortBy (\[d0,p0] [d1,p1] -> compare p1 p0) dp
      a = foldr (\[d,p] a -> a + d*p) 0 s
  in
    a

ans ([0,0]:_) = []
ans ([n,m]:l) =
  let dp = take n l
      r  = drop n l
      a  = ans' m dp
  in
    a:(ans r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o

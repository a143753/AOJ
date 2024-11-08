import Data.List

chk' x@(xh:_) =
  let l = length x
  in
    l == (length $ takeWhile (== xh) x)

chk x =
  let t = chk' $ take  9 x
      b = chk' $ drop 21 x
      n = chk' $ take  3 $ drop 18 x
      e = chk' $ take  3 $ drop 12 x
      w = chk' $ take  3 $ drop 15 x
      s = chk' $ take  3 $ drop  9 x
  in
    t && b && n && e && w && s

swap (i,j) x =
  let y = zip [1..] x
  in
    map (\ (n,e) -> if i == n
                    then x!!(j-1)
                    else if j == n
                         then x!!(i-1)
                         else e ) y

patn = [(1,28),(2,29),(3,30),(15,16),(19,21)]
pate = [(3,22),(6,25),(9,28),(12,19),(13,15)]
patw = [(1,24),(4,27),(7,30),(10,21),(16,18)]
pats = [(7,22),(8,23),(9,24),(13,18),(10,12)]

trn 'N' x = foldl (\x p -> swap p x) x patn
trn 'E' x = foldl (\x p -> swap p x) x pate
trn 'W' x = foldl (\x p -> swap p x) x patw
trn 'S' x = foldl (\x p -> swap p x) x pats

ans' n x =
  let x' = nub x
      c = any chk x'
      tn= map (trn 'N') x'
      te= map (trn 'E') x'
      tw= map (trn 'W') x'
      ts= map (trn 'S') x'
  in
    if c
    then n
    else if n == 8
         then 9
         else ans' (n+1) (tn ++ te ++ tw ++ ts)

ans x = ans' 0 [x]
    
main = do
  _ <- getLine
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = map ans i
  mapM_ print o

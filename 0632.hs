tr' ([]:_) = []
tr' x =
  let c = map head x
      x'= map (drop 1) x
  in
    c:tr' x'

ans'' :: Int -> String -> Int
ans'' _ [] = 0
ans'' n m =
  let l = length $ takeWhile (== '.') m
      a = if l >= n
          then 1
          else 0
  in
    a + (ans'' n $ drop 1 m)

ans' _ [] = 0
ans' n (m:ms) = (ans'' n m) + ans' n ms

ans n m =
  let yoko = ans' n m
      tate = ans' n $ tr' m
  in
    yoko + tate

main = do
  l <- getLine
  c <- getContents
  let [n,m,d] = map read $ words l
      c' = lines c
      o = ans d c'
  print o

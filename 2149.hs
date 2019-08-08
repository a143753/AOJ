f a b c x = ( a * x + b ) `mod` c

g _ [] = []
g n x@(xh:xs) = if n == xh then xs else x

ans' n a b c x y =
  let y' = g x y
      x' = f a b c x
  in
    if y' == []
    then n
    else if n >= 10000
    then -1
    else ans' (n+1) a b c x' y'

ans ([0,0,0,0,0]:_) = []
ans ([_,a,b,c,x]:y:r) =
  let t = ans' 0 a b c x y
  in
    t:(ans r)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o

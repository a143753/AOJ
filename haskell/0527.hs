data S = Odd | Even

cnt s [] = s
cnt s ((c,n):ts) = if c == 0 then cnt (s+n) ts else cnt s ts

f _ t [] = cnt 0 t
f Odd [] (x:xs) = f Even [(x,1)] xs
f Odd ((c,n):ts) (x:xs) =
  if c == x
  then f Even ((c,n+1):ts) xs
  else f Even ((x,1):(c,n):ts) xs

f Even ((c0,n0):[]) (x:xs) = f Odd [(x,n0+1)] xs

f Even ((c0,n0):(c1,n1):ts) (x:xs) =
  if c0 == x
  then f Odd ((x,n0+1):(c1,n1):ts) xs
  else f Odd ((x,n0+n1+1):ts) xs

ans [0] = []
ans (n:x) = 
  if n /= 0
  then (f Odd [] x'):(ans x'')
  else []
  where
    x'  = take n x
    x'' = drop n x

main = do
  c <- map read <$> lines <$> getContents :: IO [Int]
  let o = ans c
  mapM_ print o

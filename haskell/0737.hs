f 'L' (1,0,0) = (1,0,0)
f 'L' (0,1,0) = (1,0,0)
f 'L' (0,0,1) = (0,1,0)

f 'R' (1,0,0) = (0,1,0)
f 'R' (0,1,0) = (0,0,1)
f 'R' (0,0,1) = (0,0,1)

point (_,_,x) = x

ans x [] = point x
ans x (s:sr) = p + (ans x' sr)
  where
    p  = point x
    x' = f s x

main = do
  _ <- getLine
  s <- getLine
  let o = ans (1,0,0) s
  print o

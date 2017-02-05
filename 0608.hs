x a p = a * p
y b c d p =
  if p <= c
  then b
  else b + d * (p - c)

ans a b c d p =
  let xx = x a p
      yy = y b c d p
  in
    if xx <= yy
    then xx
    else yy

main = do
  z <- getContents
  let (a:b:c:d:p:_) = map read $ lines z :: [Int]
      o = ans a b c d p
  print o

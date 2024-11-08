ans [a,b,c,d,e] =
  if a < 0
  then (-a) * c + d + b * e
  else (b-a) * e

main = do
  c <- getContents
  let i = map read $ lines c
      o = ans i
  print o

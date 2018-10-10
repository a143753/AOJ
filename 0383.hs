f1 x b =
  let i = x `div` 500
      j = x `mod` 500
  in
    if j == 0 then (i * b) else ( (i+1) * b )

f2 x a b =
  let i = x `div` 1000
      r = x - i * 1000
  in
    if r > 500
    then i * a + minimum [ a, b * 2 ]
    else if r == 500
         then minimum [a, b]
         else if r > 0
              then i * a + b
              else i * a

ans a b x =
  if a >= 2 * b
  then f1 x b
  else f2 x a b

main = do
  l <- getLine
  let [a,b,x] = map read $ words l :: [Int]
      o = ans a b x
  print o

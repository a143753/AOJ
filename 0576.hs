f a c =
  if a `mod` c /= 0
           then (a `div` c) + 1
           else (a `div` c)

max' a b =
  if a >= b
  then a
  else b

ans (l:a:b:c:d:_) =
  let cc = f a c
      dd = f b d
  in
    l - max' cc dd
    

main = do
  c <- getContents
  let i = map read $ lines c :: [Int]
      o = ans i
  print o

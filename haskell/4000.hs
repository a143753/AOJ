ans [a, b] = if (a + b) `mod` 6 == 0
             then 1
             else 0

main = do
  l <- getContents
  let i = map read $ words l
      o = ans i
  print o

ans [a,n] =
  a `mod` (n+1)

main = do
  l <- getLine
  let i = map read $ words l :: [Int]
      a = ans i
  print a

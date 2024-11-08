week :: Int -> Int
week n =
  let p = n + (n * 5) `div` 100
      q = if p `mod` 1000 == 0
          then p
          else ( (p `div` 1000) + 1 ) * 1000
  in
    q

ans n =
  last $ take (n+1) $ iterate week 100000

main = do
  c <- getLine
  let i = read c :: Int
      o = ans i
  print o


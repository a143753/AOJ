c' n r ncr1 =
  let ncr = ncr1 * (n-r+1) `div` r
  in
    ncr:(c' n (r+1) ncr)

c n =
  let nc1 = n
  in
    n:(c' n 2 nc1)

ans n =
  let l = length $ takeWhile (\m -> (mod m 2) /= 0) $ c n
  in
    l + 1

main = do
  n <- getLine
  let n' = read n :: Integer
      o  = ans n'
  print o

check (a,b) =
  let v = '0' /= head b
      a' = if a == [] then 0 else read a :: Int
      b' = if b == [] then 0 else read b :: Int
      x' = (b'+a') `mod` 2
      y' = (b'-a') `mod` 2
      x  = (b'+a') `div` 2
      y  = (b'-a') `div` 2
  in
    v && (x'==0) && (y'==0) && (x >= 0) && (y >= 0)

ans s =
  let l = length s
      c = map (\i-> splitAt i s) [0 .. l-1]
      b = filter check c
      a = length b
  in
--    (c,b,a)
    a

main = do
  l <- getLine
  let o = ans l
  print o

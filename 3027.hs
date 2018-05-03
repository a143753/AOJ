import Text.Printf

log2 k n x =
  if n > x
  then k-1
  else log2 (k+1) (2*n) x

ans x =
  let l2 = log2 0 1 x
  in
    if 2^(l2+1) - 1 == x
    then l2+1
    else l2

main = do
  x <- fmap read getLine :: IO Int
  let o = ans x
  print o
  

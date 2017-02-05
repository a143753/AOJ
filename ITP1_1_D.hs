import Text.Printf

ans :: Int -> (Int,Int,Int)
ans n =
  let s = n `mod` 60
      m = ( n `div` 60 ) `mod` 60
      h = ( n `div` 3600 )
  in (h,m,s)

main = do
  l <- getLine
  let n = read l
      (h,m,s) = ans n
  printf "%d:%d:%d\n" h m s

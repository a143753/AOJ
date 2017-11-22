import Text.Printf
ans i =
  let m = 12 * 60 * i `div` 360
      h = m `div` 60
      m'= m `mod` 60
  in
    (h,m')

main = do
  l <- getLine
  let i = read l :: Int
      (h,m) = ans i
  printf "%d %d\n" h m

{-

素数^nの約数の数はn+1
異なる素数の積  素数^m * 素数^nの約数の数は(m+1)*(n+1)

なので
1. nを素因数分解する。
2. 素因数の大きい順に、素数を小さい順に割り当てる
とすればよいと考える

-}

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

{-

素数^nの約数の数はn+1
異なる素数の積  素数^m * 素数^nの約数の数は(m+1)*(n+1)

なので
1. nを素因数分解する。
2. 素因数の大きい順に、素数を小さい順に割り当てる
とすればよいと考える

-}

ans o = 2^(o-1)

main = do
  l <- getLine
  let i = read l :: Int
      o = ans i
  print o

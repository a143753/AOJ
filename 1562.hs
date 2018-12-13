{-

素数^nの約数の数はn+1
異なる素数の積  素数^m * 素数^nの約数の数は(m+1)*(n+1)

なので
1. nを素因数分解する。
2. 素因数の大きい順に、素数を小さい順に割り当てる
とすればよいと考える

-}
import Data.List
primes = [2,3,5,7,11]

decomp :: [Int] -> Int -> [Int]
decomp _ 1 = []
decomp p@(ph:pt) n = 
    if (n `mod` ph) == 0
    then ph:(decomp p (n `div` ph) )
    else decomp pt n
f :: [Int] -> [Int] -> Int
f _ [] = 1
f (p:ps) (v:ds) = p^(v-1) * (f ps ds)

-- |
-- >>> ans 1
-- 1
-- >>> ans 2
-- 2
-- >>> ans 3
-- 4
-- >>> ans 4
-- 6
-- >>> ans 5
-- 16
-- >>> ans 6
-- 12
-- >>> ans 7
-- 64
-- >>> ans 8
-- 24

ans 1 = 1
ans n = 
    let d = reverse $ decomp primes n
        a = f primes d
    in
        a

main = do
  l <- getLine
  let i = read l :: Int
      o = ans i
  print o

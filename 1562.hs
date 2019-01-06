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

idx n = idx' n
    where
        idx' 1 = map (\i -> [i]) [1..n]
        idx' k = 
            let t = idx' (k-1)
            in
                concat $ map (\i -> map (\s -> i:s) t) [1..n]

divide s =
    let i = idx l
        d = map (\j -> zip j s) i
    in
        map (\a -> filter (/= []) a) $ nub $ map f d
    where
        l = length s
        f d = sort $ map (\ i -> map snd $ filter (\(j,v) -> i==j) d) [1..l]

cal :: [[Int]] -> Int
cal l =
    let p = reverse $ sort $ map (\l0 -> foldl (\p a -> p * a) 1 l0) l
    in
        f primes p 

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

--ans 1 = 1
ans n = 
    let d = reverse $ decomp primes n
        s = divide d
        a = map cal s
    in
        if a == [] then 1 else (minimum a)

main = do
  l <- getLine
  let i = read l :: Int
      o = ans i
  print o

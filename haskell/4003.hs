import Data.List

psum _ [] = []
psum s (a:as) = s':(psum s' as)
  where
    s' = a + s

sigma k a q = (l * k) + (q!!l)
  where
    l = length $ takeWhile (>= k) a

judge :: Int -> [Int] -> [Int] -> [Int] -> Bool
judge k [] _ _ = True
judge k (ph:ps) q@(_:qs) a@(_:as) = c && (judge (k+1) ps qs as)
  where
    l = ph
    r = k * (k - 1) + (sigma k as qs)
    c = (l <= r)

ans n a = 
  if odd s
  then "No"
  else if judge 1 p q a' then "Yes" else "No"
  where
    k = 1
    s = sum a
    a'= sortBy (\x y -> compare y x) a
    p = psum 0 a'
    q = reverse (0:(psum 0 $ reverse a'))
    
main = do
  n <- readLn :: IO Int
  a <- map read . words <$> getLine :: IO [Int]
  let o = ans n a
  putStrLn o

{-
この問題は貪欲法(greedy法)で解けることが証明されているらしい。
ということでlistを使ってsimpleに実装したところ,N=50000でTLEとなった。

merge [] b = b
merge a [] = a
merge (a:as) (b:bs) =
  if a >= b
  then a:(merge as (b:bs))
  else b:(merge (a:as) bs)

ans' [] = "Yes"
ans' (a:as) = if a > l then "No" else (ans' $ merge x y)
  where
    l = length as
    x = filter (/= 0) $ map (\x -> x - 1) $ take a as
    y = drop a as

ans n a = if head a' >= n
          then "No"
          else if s < t - s
               then ans' a'
               else ans' b 
  where
    t = n * (n - 1) `div` 2
    s = sum a
    a'= sortBy (\x y -> compare y x) a
    b = reverse $ filter (/= 0) $ map (\x -> n - 1 - x) a'

上記はErdos-Gallaiの定理を使っている
-}

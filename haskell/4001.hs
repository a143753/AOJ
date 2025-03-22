import Data.List

pack i =
  sub $ sort i
  where sub []= []
        sub l@(a:_)  =
          let n = length $ takeWhile (== a) l
          in (a, n) : sub (drop n l)
          
f :: [Int] -> [[Int]]
f [] = []
f (xh:xs) = (xs : map (\r -> (xh:r)) (f xs))

c [] = False
c ((_,n):xs) = if n >= 2 then True else c xs

g l 
  | and l     = 1
  | or  l     = 3
  | otherwise = 2

main = do
  l <- getContents
  let i = map read $ words l :: [Int]
      o = g $ map c $ map pack $ f i
  print o

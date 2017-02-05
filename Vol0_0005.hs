-- GCD and LCM

import Text.Printf

gcd' :: Int -> Int -> Int
gcd' x 0 = x
gcd' x y = gcd' y (x `mod` y)

ans :: Int -> Int -> (Int,Int)
ans x y =
    let g = if x >= y
            then gcd' x y
            else gcd' y x
        l = (x `div` g) * (y `div` g) * g
    in
      (g, l)

main = do
  c <- getContents
  let i0 = map words $ lines c
      i  = map (map read) i0 :: [[Int]]
      o  = map (\(x0:x1:xs) -> ans x0 x1) i
  mapM_ (\(a,b) -> printf "%d %d\n" a b) o

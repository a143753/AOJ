-- 1袋
-- A     B    C
-- 1.90  1.83 1.7
-- まとめ買い
-- 1000  1200 1500
-- 1.52  1.56 1.44

price m v t r x =
  let n = (x+m-1) `div` m  -- n袋
      n'= n `div` t  -- 割り引き対象
  in
    v * n' * t * r `div` 100 + v * (n-n'*t)

priceA = price 200 380 5 80
priceB = price 300 550 4 85
priceC = price 500 850 3 88

ans x =
  let pa = priceA x
      pb = priceB x
      pc = priceC x
  in
    [pa,pb,pc]

main = do
  c <- getContents
  let i = takeWhile (/= 0) $ map read $ lines c :: [Int]
      o = map ans i
  print o

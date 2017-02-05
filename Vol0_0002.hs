-- Digit Number
-- http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=0002

digits :: Int -> Int -> Int
digits n a
    | a == 0    = n
    | otherwise = digits (n + 1)  (a `div` 10)

ans :: (Int,Int) -> Int
ans (a,b) = digits 0 (a + b)

main = do
  c <- getContents
  let i = map (map read . words) $ lines c :: [[Int]]
      j = map (\(x0:x1:xs) -> (x0,x1)) i
      k = map ans j
  mapM_ (putStrLn.show) k

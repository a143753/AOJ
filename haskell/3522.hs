ans [[h1,w1], [h2,w2]] = h * w
  where
    f v1 v2 = if v1 `mod` v2 == 0 then (v1 `div` v2) else (v1 `div` v2) + 1
    h = f h1 h2
    w = f w1 w2

main = do
  c <- getContents
  let i = map (map read . words) $ lines c :: [[Int]]
      o = ans i
  putStrLn $ show o

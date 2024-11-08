f i d =
  let m = d `mod` i
      v = d `div` i
      n = f (i+1) d
  in
    if v < i
    then []
    else if m /= 0
         then n
         else if v == i
              then [v]
              else (i:v:n)

ans d =
  let y = f 2 d
      y'= if d == 1 then y else (1:y)
      s = sum y'
  in
    if d > s then "deficient number"
    else if d == s then "perfect number" else "abundant number"

main = do
  c <- getContents
  let i = takeWhile (/= 0) $ map read $ lines c :: [Int]
      o = map ans i
  mapM_ putStrLn o

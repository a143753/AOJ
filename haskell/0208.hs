-- 1234567890
-- oooxoxoooo

dec2oct 0 = []
dec2oct n =
  let a = n `mod` 8
      b = n `div` 8
  in
    a:(dec2oct b)

oct2ans s [] = s
oct2ans s (n:ns) =
  let n' = if n <= 3
           then n
           else if n <= 4
                then n + 1
                else n + 2
      s' = s * 10 + n'
  in
    oct2ans s' ns

ans i =
  let t = reverse $ dec2oct i
  in
    oct2ans 0 t

main = do
  c <- getContents
  let i = takeWhile (/= 0) $ map read $ lines c :: [Int]
      o = map ans i
  mapM_ print o
  

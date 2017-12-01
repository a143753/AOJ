g 0 a b c = b
g n a b c = g (n-1) (a+b+c) a b
f n = g n 1 1 0

ans i =
  let d = f i
      y = d `div` (365*10)
      m = d `mod` (365*10)
  in
    if m == 0
    then y
    else y+1

main = do
  c <- getContents
  let i = takeWhile (/= 0) $ map read $ lines c :: [Int]
      o = map ans i
      f'= map f [1..10]
      g'= map (\n -> g n 1 1 0)  [1..10]
  mapM_ print o

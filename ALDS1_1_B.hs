gcd' :: Int -> Int -> Int
gcd' x 0 = x
gcd' x y = gcd' y (x `mod` y)

ans :: Int -> Int -> Int
ans x y =
  if x >= y
  then gcd' x y
  else gcd' y x

main = do
  l <- getLine
  let i  = map read $ words l :: [Int]
      o  = ans (i!!0) (i!!1)
  putStrLn $ show o

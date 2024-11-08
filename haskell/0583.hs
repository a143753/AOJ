cd i n
  | i > n     = []
  | otherwise =
      if (n `mod` i) == 0
      then i:(cd (i+1) n)
      else cd (i+1) n

ans x =
  let g = foldr1 gcd x
      c = cd 1 g
  in
    c

main = do
  _ <- getLine
  l <- getLine
  let i = map read $ words l :: [Int]
      o = ans i
  mapM_ print o
  

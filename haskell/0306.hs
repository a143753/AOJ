ans' 0 = []
ans' i =
  let r = i `mod` 3
      s = i `div` 3
  in
    if r /= 2
    then r:(ans' s)
    else if r == 2
         then (-1:(ans' (s+1)))
         else ( 1:(ans' (s-1)))

ans i =
  map (\x -> case x of
               0  -> '0'
               1  -> '+'
               -1 -> '-' ) $ reverse $ ans' i

main = do
  l <- getLine
  let i = read l :: Int
      o = ans i
  putStrLn o
      

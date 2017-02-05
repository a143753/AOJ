import Text.Printf

conA n =
  if n `mod` 3 == 0
  then True
  else False

conB 0 = False
conB n =
  if n `mod` 10 == 3
  then True
  else conB (n `div` 10)

judge :: Int -> Bool
judge n = (conA n) || (conB n)

main = do
  l <- getLine
  let i = read l
      o = filter judge $ [1..i] 

  mapM_ (printf " %d") o
  putStrLn ""

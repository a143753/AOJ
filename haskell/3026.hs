ans x =
  let n = x `div` 100
      s = take n $ repeat '3'
  in
    "ai1333" ++ s

main = do
  l <- getLine
  let i = read l :: Int
      o = ans i
  putStrLn o

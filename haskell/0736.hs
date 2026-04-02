ans n = if u == l then 1 else 0
  where
    u = n `div` 10
    l = n `mod` 10

main = do
  n <- readLn :: IO Int
  let o = ans n
  print o
  

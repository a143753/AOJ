ans n = n `mod` 2024

main = do
  n <- readLn :: IO Int
  let o = ans n
  print o

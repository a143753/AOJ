main = do
  x <- readLn :: IO Int
  let o = x `mod` 21
  print o

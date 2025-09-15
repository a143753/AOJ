ans i
  |i >= 97 && i <= 122 = 2
  |i >= 65 && i <= 90 = 1
  |otherwise = 0

main = do
  i <- read <$> getLine :: IO Int
  let o = ans i
  print o

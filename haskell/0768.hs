ans x = if x `mod` 7 == 2 then 1 else 0
main = do
  i <- read <$> getLine :: IO Int
  let o = ans i
  print o

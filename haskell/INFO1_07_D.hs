ans n
  | n >= 80  = "A"
  | n >= 65  = "B"
  | n >= 50  = "C"
  | n >= 35  = "D"
  | n >= 0   = "F"

main = do
  n <- readLn :: IO Int
  putStrLn $ ans n

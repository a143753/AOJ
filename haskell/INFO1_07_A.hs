main = do
  n <- readLn :: IO Int
  putStr $ if n > 0 then "yes\n" else ""

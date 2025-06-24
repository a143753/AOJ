main = do
  n <- readLn :: IO Int
  putStrLn $ if n > 0 then "yes" else "no"

main = do
  n <- readLn :: IO Int
  putStrLn $ if n > 0 then "1" else if n == 0 then "0" else "-1"

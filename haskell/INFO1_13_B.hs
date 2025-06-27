ans n c = take n $ repeat c

main = do
  n <- read <$> getLine :: IO Int
  c <- head <$> getLine
  putStrLn $ ans n c

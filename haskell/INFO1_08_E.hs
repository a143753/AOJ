main = do
  n <- read <$> getLine :: IO Int
  let s = take n $ repeat (take n $ repeat '#')
  mapM_ putStrLn s

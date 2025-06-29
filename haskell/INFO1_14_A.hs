ans x k = if elem k x then "Yes" else "No"

main = do
  n <- readLn :: IO Int
  x <- take n <$> map read <$> words <$> getLine :: IO [Int]
  k <- readLn :: IO Int
  let y = ans x k
  putStrLn y
  

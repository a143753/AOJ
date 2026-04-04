tobin :: Int -> [Int]
tobin x = reverse $ sub 32 x
  where
    sub 0 _ = []
    sub n x = (x `mod` 2) : sub (n - 1) (x `div` 2)

main = do
  x <- readLn :: IO Int
  putStrLn $ concat $ map show $ tobin x
  putStrLn $ concat $ map show $ tobin (2^32 - 1 - x)
  putStrLn $ concat $ map show $ tobin (x * 2)
  putStrLn $ concat $ map show $ tobin (x `div` 2)

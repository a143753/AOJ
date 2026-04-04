import Data.Bits

tobin :: Int -> [Int]
tobin x = reverse $ sub 32 x
  where
    sub 0 _ = []
    sub n x = (x `mod` 2) : sub (n - 1) (x `div` 2)

main = do
  [a, b] <- map read <$> words <$> getLine :: IO [Int]
  putStrLn $ concat $ map show $ tobin ( a .&. b)
  putStrLn $ concat $ map show $ tobin ( a .|. b)
  putStrLn $ concat $ map show $ tobin ( a `xor` b)

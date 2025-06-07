import Data.Char

main = do
  i <- read <$> getLine :: IO Int
  putStrLn $ [chr i]

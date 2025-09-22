import Data.Char (toUpper)

main = do
  l <- getLine
  putStrLn $ map toUpper l

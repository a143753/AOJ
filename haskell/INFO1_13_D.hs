import Data.List (intercalate)

ans x = "(" ++ (intercalate ", " x) ++ ")"

main = do
  n <- readLn :: IO Int
  x <- take n <$> words <$> getLine :: IO [String]
  let y = ans x
  putStrLn y

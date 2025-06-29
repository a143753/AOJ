import Data.List (intercalate)

to_s x = "(" ++ (intercalate ", " x') ++ ")"
  where x' = map show x :: [String]
ans x k = map (* k) x :: [Int]

main = do
  n <- readLn :: IO Int
  x <- take n <$> map read <$> words <$> getLine :: IO [Int]
  k <- readLn :: IO Int
  let y = ans x k
  putStrLn $ to_s x
  putStrLn $ to_s y

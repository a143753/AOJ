import Data.List (intercalate)

to_s x = "(" ++ (intercalate ", " x') ++ ")"
  where x' = map show x :: [String]
ans a b = map (\(ea,eb) -> ea+eb) $ zip a b

main = do
  n <- readLn :: IO Int
  a <- take n <$> map read <$> words <$> getLine :: IO [Int]
  b <- take n <$> map read <$> words <$> getLine :: IO [Int]
  let y = ans a b
  putStrLn $ to_s a
  putStrLn $ to_s b
  putStrLn $ to_s y

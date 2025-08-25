import Data.List (sort)

ans = sort

main = do
  _ <- getLine
  a <- map read <$> words <$> getLine :: IO [Int]
  let o = ans a
  putStrLn $ unwords $ map show o

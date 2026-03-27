import Data.List

ans :: Int -> [Int] -> Int -> [Int]
ans k a b = filter (\ e -> e + k == b) a

main = do
  k <- read <$> getLine :: IO Int
  _ <- getLine
  a <- map read <$> words <$> getLine :: IO [Int]
  _ <- getLine
  b <- map read <$> words <$> getLine :: IO [Int]
  let o = length $ concat $ map (ans k a) b
  print o

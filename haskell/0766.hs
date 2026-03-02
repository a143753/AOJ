import Data.List (sort)

g [] = []
g (x:xs) = x : g (dropWhile (== x) xs)

f = g . sort

main = do
  _ <- getLine
  a <- map read <$> words <$> getLine :: IO [Int]
  let b = f a
  mapM_ print b

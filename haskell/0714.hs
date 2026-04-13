import Data.List

pack :: Eq a => [a] -> [(a, Int)]
pack [] = []
pack (x:xs) = (x, 1 + (length $ takeWhile (== x) xs)) : pack (dropWhile (== x) xs)

ans a = fst $ head $ sortBy cmp $ pack $ sort a
  where
    p = pack a
    cmp (x1,y1) (x2,y2) = compare y1 y2

main = do
  _ <- getLine
  a <- map read . words <$> getLine :: IO [Int]
  let o = ans a
  print o
  

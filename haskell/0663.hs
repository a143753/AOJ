import Data.List (sort)

ans a = (a'!!1)
  where
    a' = sort a

main = do
  a <- map read . words <$> getLine :: IO [Int]
  let o = ans a
  print o

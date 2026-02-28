import Data.List (sort)
ans lst =
  if c == a + b then 1 else 0
  where
    [a,b,c] = sort lst
      
main = do
  i <- map read <$> lines <$> getContents :: IO [Int]
  let o = ans i
  print o

import Data.List (sort)

ans a = chk $ sort a
  where
    chk (x:[]) = x
    chk (x:y:xs) = if x == y then chk xs else x

main = do
  _ <- getLine
  a <- map read <$> words <$> getLine :: IO [Int]
  let o = ans a
  print o

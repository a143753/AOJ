import Data.List (nub, sort)

chk n [] _ = n
chk n _ [] = n
chk n (a:as) (b:bs) =
  if a == b
  then chk (n + 1) as (b:bs)
  else if a < b
       then chk n as (b:bs)
       else chk n (a:as) bs

ans a b = chk 0 a' b'
  where
    a' = sort a
    b' = nub $ sort b

main = do
  _ <- getLine
  a <- map read <$> words <$> getLine :: IO [Int]
  b <- map read <$> words <$> getLine :: IO [Int]
  let o = ans a b
  print o

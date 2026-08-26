import Data.List

ans a b = sub a' b'
  where
    a' = sort $ nub a
    b' = sort $ nub b
    sub [] _ = []
    sub _ [] = []
    sub a@(ah:as) b@(bh:bs) =
      if ah == bh
      then ah:(sub as bs)
      else if ah < bh
           then sub as b
           else sub a bs

main = do
  _ <- getLine
  a <- map read <$> words <$> getLine :: IO [Int]
  b <- map read <$> words <$> getLine :: IO [Int]
  let o = ans a b
  mapM_ print o

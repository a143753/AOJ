ans x [] = x
ans x (a:as) =
  let a' = take (a-1) x
      (b:bs) = drop (a-1) x
      b' = if bs == []
           then if b >= 2019 then [b] else [b+1]
           else if (head bs) - b > 1
                then (b+1):bs
                else (b:bs)
  in
    ans (a' ++ b') as

main = do
  _ <- getLine
  x <- map read . words <$> getLine :: IO [Int]
  _ <- getLine
  a <- map read . words <$> getLine :: IO [Int]
  let o = ans x a
  mapM_ print o

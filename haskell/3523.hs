ans l [] = "No"
ans l ((v,i):as) = if l <= v then (show i) else ans (l - v) as

main = do
  [l,_] <- map read <$> words <$> getLine :: IO [Int]
  a <- map read <$> words <$> getLine :: IO [Int]
  let o = ans l $ zip a [1..]
  putStrLn o

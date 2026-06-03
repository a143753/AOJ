gen n = take n $ cycle "IO"
ans n s = length $ filter (uncurry (/=)) $ zip s (gen n)

main = do
  n <- read <$> getLine :: IO Int
  s <- getLine :: IO String
  let o = ans n s
  print o

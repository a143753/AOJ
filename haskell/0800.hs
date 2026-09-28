ans x = if (sum x) <= 21 then 1 else 0

main = do
  x <- map read <$> lines <$> getContents :: IO [Int]
  let o = ans x
  print o

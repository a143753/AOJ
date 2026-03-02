f x = case r of
        0 -> x + 1
        1 -> x * 2
        2 -> x * 3
  where r = x `mod` 3
g x = (x:(g (f x)))

ans n x = length $ takeWhile (< n) (g x)

main = do
  x <- read <$> getLine :: IO Int
  n <- read <$> getLine :: IO Int
  let o = ans n x
  print o

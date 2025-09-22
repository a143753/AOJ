ans a b c = 7 * w + d
  where
    w = c `div` (7*a + b)
    r = c `mod` (7*a + b)
    d = if (r >= 7*a) then 7
        else if (mod r a) == 0
             then ((r `div` a))
             else ((r `div` a) + 1)

main = do
  [a, b, c] <- map read . words <$> getLine :: IO [Int]
  let o = ans a b c
  print o

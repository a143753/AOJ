ans n a b =
  let c = lcm a b
  in
    ( n `div` a ) + ( n `div` b ) - 2 * ( n `div` c )

main = do
  [n,a,b] <- map read . lines <$> getContents :: IO [Int]
  let o = ans n a b
  print o

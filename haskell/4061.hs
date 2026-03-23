ans h c r = if h < c - r then "up"
            else if h <= c + r then "side"
                 else "down"

main = do
  [h,c,r] <- map read . words <$> getLine :: IO [Int]
  let o = ans h c r
  putStrLn o

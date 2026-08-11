ans :: [[Int]] -> String
ans [[n,m,k,x], as] = if dist >= x then "Yes" else "No"
  where
    amax = maximum as
    dist = (amax * k) `div` m

main = do
  c <- map (map read) <$> map words <$> lines <$> getContents :: IO [[Int]]
  let o = ans c
  putStrLn o
  

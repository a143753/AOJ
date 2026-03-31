ans x y z = if cond then 1 else 0
  where
    cond = (x + y) <= z

main = do
  [x,y,z] <- map read <$> lines<$> getContents :: IO [Int]
  let o = ans x y z
  print o

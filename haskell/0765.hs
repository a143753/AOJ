f [] _ = 0
f (x:xs) (y:ys) | x == y = 0 + f xs ys
                | otherwise = 1 + f xs ys

main = do
  _ <- getLine
  s <- getLine
  t <- getLine
  let a = f s t
  print a

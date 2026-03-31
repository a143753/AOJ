ans s = if p == q then "Yes" else "No"
  where
    l = length s
    p = take (l `div` 2) s
    q = drop (l `div` 2) s

main = do
  _ <- getLine
  s <- getLine
  let o = ans s
  putStrLn o

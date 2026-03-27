ans [] = "Yes"
ans (_:[]) = "Yes"
ans (x1:x2:xs) = if x1 /= x2 then "No" else ans (x2:xs)

main = do
  _ <- getLine
  s <- getLine
  let o = ans s
  putStrLn o

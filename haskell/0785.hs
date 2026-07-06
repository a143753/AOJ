ans []     = "No"
ans (x0:[]) = "No"
ans (x1:x0:[]) = "No"
ans (x2:x1:x0:xs) =
  if x2 == 'o' && x1 == 'o' && x0 == 'o'
  then "Yes"
  else ans (x1:x0:xs)

main = do
  _ <- getLine
  s <- getLine
  let o = ans s
  putStrLn o

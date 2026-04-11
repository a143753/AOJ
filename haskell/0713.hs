ans (_:[]) = []
ans (x0:x1:xs) =
  if x1 == 'J'
  then x0 : ans (x1:xs)
  else ans (x1:xs)

main = do
  _ <- getLine
  s <- getLine
  let o = ans s
  mapM_ (\c -> putStrLn [c]) o

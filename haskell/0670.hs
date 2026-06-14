ans [] = []
ans (x1:[]) = [x1]
ans (x1:x2:[]) = [x1,x2]
ans ('j':'o':'i':xs) = "JOI" ++ (ans xs)
ans (x:xs) = x : ans xs

main = do
  _ <- getLine
  s <- getLine
  let o = ans s
  putStrLn o

ans s = if last s == 'G' then init s else s ++ "G"

main = do
  _ <- getLine
  s <- getLine
  let o = ans s
  putStrLn o
  

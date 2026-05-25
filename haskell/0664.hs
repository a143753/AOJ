ans s = length $ filter ( `elem` "aiueo" ) s 

main = do
  _ <- getLine
  s <- getLine
  let o = ans s
  print o
  

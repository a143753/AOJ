ans "1 0 0" = "Close"
ans "0 1 0" = "Close"
ans "1 1 0" = "Open"
ans "0 0 1" = "Open"
ans "0 0 0" = "Close"

main = do
  l <- getLine
  let o = ans l
  putStrLn o
 

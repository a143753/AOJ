ans :: [Int] -> String
ans (a:b:s) 
  | a >  b = "a > b"
  | a <  b = "a < b"
  | a == b = "a == b"

main = do
  l <- getLine
  let i = map read $ words l
      a = ans i
  putStrLn a

ans :: [Int] -> String
ans (a:b:c:s) 
  | b > a && c > b = "Yes"
  | otherwise      = "No"

main = do
  l <- getLine
  let i = map read $ words l
      a = ans i
  putStrLn a

ans (m:f:b:_) =
  if m >= b
  then "0"
  else if (m+f) >= b
       then show (b-m)
       else "NA"

main = do
  l <- getLine
  let i = map read $ words l :: [Int]
      o = ans i
  putStrLn o
      

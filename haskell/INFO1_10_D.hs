import Data.Char

ans s =
  if isLower s
  then "lower"
  else if isUpper s
       then "upper"
       else if isDigit s
            then "digit"
            else "other"

main = do
  c <- getLine
  let a = ans $ head c
  putStrLn a

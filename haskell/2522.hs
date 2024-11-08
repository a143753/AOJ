import Data.Char
ans s =
  let c1 = (length s) >= 6
      c2 = [] /= (filter isDigit s)
      c3 = [] /= (filter isLower s)
      c4 = [] /= (filter isUpper s)
  in
    if c1 && c2 && c3 && c4 then "VALID" else "INVALID"

main = do
  l <- getLine
  let o = ans l
  putStrLn o
  

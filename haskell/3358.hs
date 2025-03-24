import Data.List
import Data.Char

ans ["#"] = []
ans (x:xs) = s:ans xs
  where
    sub a b
      | isLower a && isLower b = compare a b
      | isLower a && isUpper b = LT
      | isLower a && isDigit b = LT
      | isUpper a && isLower b = GT
      | isUpper a && isUpper b = compare a b
      | isUpper a && isDigit b = LT
      | isDigit a && isLower b = GT
      | isDigit a && isUpper b = GT
      | isDigit a && isDigit b = compare a b
    s = sortBy sub x

main = do
  c <-getContents
  let o = ans $ lines c
  mapM_ putStrLn o

  

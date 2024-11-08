import Data.List

ans :: String -> String -> String
ans [] _ = "Yes"
ans _ [] = "No"
ans pat@(p:ps) text@(t:ts) = if isPrefixOf pat text
                             then "Yes"
                             else ans pat ts

main = do
  s <- getLine
  p <- getLine
  let s' = s ++ s
      o  = ans p s'
  putStrLn o

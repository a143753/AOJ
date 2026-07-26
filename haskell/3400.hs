import Data.Char (toUpper)

ans s@(c:_) = map (\cc -> if cc == c then c' else cc) s
  where
    c' = toUpper c
    
main = do
  _ <- getLine
  s <- getLine
  let o = ans s
  putStrLn o

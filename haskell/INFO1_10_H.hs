import Data.Char (isDigit)

ans s = if c
        then show $ (+ 1) $ read s
        else s
  where
    c = and $ map isDigit s

main = do
  s <- getLine
  let a = ans s
  putStrLn a

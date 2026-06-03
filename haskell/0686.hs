ans s = if s1 /= [] && s2 /= [] && s3 then "Yes" else "No"
  where
    s1 = dropWhile (/= 'I') s
    s2 = dropWhile (/= 'O') s1
    s3 = 'I' `elem` s2
    
main = do
  _ <- getLine
  s <- getLine
  let o = ans s
  putStrLn o

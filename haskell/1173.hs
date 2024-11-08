ans :: String -> String -> String
ans s ('(':as) = ans ('(':s) as
ans s ('[':as) = ans ('[':s) as
ans (s:sr) (')':as) = if s == '(' then (ans sr as) else "no"
ans (s:sr) (']':as) = if s == '[' then (ans sr as) else "no"
ans [] (')':as) = "no"
ans [] (']':as) = "no"
ans s (a:as) = ans s as
ans (a:as) [] = "no"
ans [] [] = "yes"

main = do
  c <- getContents
  let i = takeWhile (/= ".") $ lines c
      o = map (ans []) i
  mapM_ putStrLn o
  

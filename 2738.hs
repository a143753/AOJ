ans s [] = if s == 0 then "YES" else "NO"
ans s (l:ls) =
  case l of
    "A"  -> ans (s+1) ls
    "Un" -> if s == 0 then "NO" else ans (s-1) ls

main = do
  _ <- getLine
  c <- getContents
  let i = lines c
      o = ans 0 i
  putStrLn o
  

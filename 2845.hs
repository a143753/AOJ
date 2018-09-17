ans l (c:cs) = case c of
                 '*' -> l
                 '(' -> ans (l+1) cs
                 ')' -> ans (l-1) cs

main = do
  i <- getLine
  let o = ans 0 i
  print o

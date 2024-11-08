m "T" "F" = "F"
m _ _ = "T"

ans (c:[]) = c
ans (c1:c2:cr) = ans ((m c1 c2):cr)

main = do
  _ <- getLine
  l <- getLine
  let i = words l
      o = ans i
  putStrLn o
  

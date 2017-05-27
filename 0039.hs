ans [] = 0
ans ('I':'V':xs) =   4 + ans xs
ans ('I':'X':xs) =   9 + ans xs
ans ('X':'L':xs) =  40 + ans xs
ans ('X':'C':xs) =  90 + ans xs
ans ('C':'D':xs) = 400 + ans xs
ans ('C':'M':xs) = 900 + ans xs
ans ('I':xs)     =   1 + ans xs
ans ('V':xs)     =   5 + ans xs
ans ('X':xs)     =  10 + ans xs
ans ('L':xs)     =  50 + ans xs
ans ('C':xs)     = 100 + ans xs
ans ('D':xs)     = 500 + ans xs
ans ('M':xs)     =1000 + ans xs

main = do
  c <- getContents
  let i = lines c
      o = map ans i
  mapM_ print o

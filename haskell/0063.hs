import Data.List

ans s =
  let r = reverse s
  in
    if r == s
    then 1
    else 0

main = do
  c <- getContents
  let i = lines c
      o = sum $ map ans i
  print o
  

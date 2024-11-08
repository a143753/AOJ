ans' l =
  let l1 = dropWhile (/= 'A') l 
      l2 = dropWhile (/= 'Z') l1
  in
    if (l1 == []) || (l2 == [])
    then []
    else "AZ" ++ (ans' $ drop 1 l2)

ans l =
  let a = ans' l
  in
    if a == []
    then "-1"
    else a

main = do
  l <- getLine
  let o = ans l
  putStrLn o

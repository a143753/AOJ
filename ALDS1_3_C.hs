drop' v (x:xs) =
  if v == x
  then xs
  else x:(drop' v xs)

exec :: [Int] -> [String] -> [Int]
exec l ["insert", x] = l `seq` (read x):l
exec l ["delete", x] =
  let x' = read x
  in 
    if elem x' l
    then l `seq` drop' x' l
    else l
exec l ["deleteFirst"] = l `seq` tail l
exec l ["deleteLast"]  = l `seq` init l

main = do
  n <- getLine
  c <- getContents
  let i = map words $ lines c
      o = foldl exec [] i
  putStrLn $ unwords $ map show o

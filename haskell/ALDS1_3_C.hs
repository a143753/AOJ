import System.IO

drop' v (x:xs) =
  if v == x
  then xs
  else x:(drop' v xs)

exec :: [Int] -> [String] -> [Int]
exec s ["insert", x] = (read x):s
exec s ["delete", x] =
  let x' = read x
  in 
    if elem x' s
    then drop' x' s
    else s
exec s ["deleteFirst"] = tail s
exec s ["deleteLast"]  = init s

play :: [Int] -> IO [Int]
play s = do
  l <- getLine
  let i = words l
      o = exec s i
  eof <- isEOF
  if eof
  then return o
  else play o

main = do
  n <- getLine
  o <- play []
  putStrLn $ unwords $ map show o

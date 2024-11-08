-- 位置iからn文字を取り出す
--split i n s = drop i $ take (i+n) s
split i n s = take n $ drop i s

set :: String -> Int -> Int -> Char -> String
set u x y z =
  let h = take (x-1) u
      f = drop y u
      b = take (y-x+1) $ repeat z
  in
    h ++ b ++ f

comp u a b c d =
  let s = split (a-1) (b-a+1) u
      t = split (c-1) (d-c+1) u
  in
    if s > t
    then "t"
    else
      if s == t
      then "e"
      else "s"

play _ [] = []
play _ [[]] = []
play u (("comp":a:b:c:d:_):cmds) = 
  let a' = read a
      b' = read b
      c' = read c
      d' = read d
      o  = u `seq` comp u a' b' c' d'
  in
    o:(play u cmds)
 
play u (("set":x:y:z:_):cmds) =
  let x' = read x
      y' = read y
      z' = z!!0
      u' = u `seq` set u x' y' z'
  in
    play u' cmds

main = do
  _ <- getLine
  u <- getLine
  _ <- getLine
  c <- getContents
  let i  = map words $ lines c
      u' = read u :: String
      o = play u i
  mapM_ putStrLn o

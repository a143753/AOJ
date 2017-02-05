set :: String -> Int -> Int -> Char -> String
set u x y z =
  let h = take (x-1) u
      f = drop y u
      b = take (y-x+1) $ repeat z
  in
    h ++ b ++ f

comp u a b c d =
  let s = drop (a-1) $ take b u
      t = drop (c-1) $ take d u
  in
    if s > t
    then "t"
    else
      if s == t
      then "e"
      else "s"

play :: String -> [[String]] -> IO()
play _ [] = return ()
play _ [[]] = return ()
play u (("comp":a:b:c:d:_):cmds) = do
  let a' = read a
      b' = read b
      c' = read c
      d' = read d
      o  = comp u a' b' c' d'
  putStrLn o
  play u cmds
 
play u (("set":x:y:z:_):cmds) = do
  let x' = read x
      y' = read y
      z' = z!!0
      u' = set u x' y' z'
  play u' cmds

main = do
  n <- getLine
  u <- getLine
  q <- getLine
  c <- getContents
  let i = map words $ lines c
  play u i

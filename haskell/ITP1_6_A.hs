pr :: [String] -> IO()
pr [] = do
  putStrLn ""
  return ()
pr (s:[]) = do
  putStrLn s
  return ()
pr (s:sx) = do
  putStr (s++" ")
  pr sx
  return ()

main = do
  l <- getContents
  let i = (lines l)!!1
      o = reverse $ words i
  pr o

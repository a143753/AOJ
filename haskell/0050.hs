import Data.List

ans :: String -> String
ans [] = []
ans str@(s:ss) =
  if isPrefixOf "apple" str
  then "peach" ++ ans (drop 5 str)
  else
    if isPrefixOf "peach" str
    then "apple" ++ ans (drop 5 str)
    else s:(ans ss)

main = do
  c <- getContents
  let l = lines c
      o = map ans l
  mapM_ putStrLn o

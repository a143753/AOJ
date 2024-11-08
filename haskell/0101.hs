import Data.List

replace :: String -> String -> String -> String
replace _ _ [] = []
replace patA patB str@(s:sx) =
  if isPrefixOf patA str
  then replace patA patB (patB ++ (drop (length patA) str))
  else s:(replace patA patB sx)

ans :: [String] -> [String]
ans inputs =
  map (replace "Hoshino" "Hoshina") inputs

main = do
  c <- getContents
  let i = drop 1 $ lines c
      o = ans i
  mapM_ putStrLn o

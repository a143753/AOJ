import Data.Char

ans :: String -> String
ans [] = []
ans (c:cs)
  | isUpper c  = (toLower c):(ans cs)
  | isLower c  = (toUpper c):(ans cs)
  | otherwise  = c:(ans cs)

main = do
  c <- getContents
  let i = lines c
      o = map ans i
  mapM_ putStrLn o
  

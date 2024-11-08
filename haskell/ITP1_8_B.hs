import Data.Char

main = do
  c <- getContents
  let i' = map (map digitToInt) $ lines c
      i  = takeWhile (/= [0]) i'
      o  = map sum i
  mapM_ print o

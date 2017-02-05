import Data.Char

main = do
  w <- getLine
  let w' = map toLower w
  c <- getContents
  let i = map (map toLower) $ concat $ map words $ takeWhile (/= "END_OF_TEXT") $ lines c
      o = length $ filter (==w') i
  print o

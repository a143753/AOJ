import Data.List

ans i =
  let l = length(i)
      l'= length $ nub $ map sort i
  in
    l - l'

main = do
  _ <- getLine
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  print o

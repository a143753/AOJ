import Data.Char
import Data.List

judge x i =
  if (length $ filter (== i) x) >= 4
  then False
  else True

ans :: [Int] -> [Int]
ans x = filter (judge x) [1..9]

main = do
  c <- getContents
  let xs = map (map digitToInt) $ lines c :: [[Int]]
      ys = map ans xs
  print xs
  print ys

import Data.List

main = do
  l <- getLine
  let (a:b:c:d:_) = sort $ map read $ words l :: [Int]
      res = if a == b && c == d
            then "yes"
            else "no"
  putStrLn res
  

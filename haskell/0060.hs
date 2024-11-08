import Data.List

ans c@(c1:c2:c3:_) =
  let r = [1..10] \\ c
      a = filter (\x -> x+c1+c2 <= 20) r
  in
    if (length a) >= 4
    then "YES"
    else "NO"

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = map ans i
  mapM_ putStrLn o

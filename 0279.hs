import Data.List

chk s [] = []
chk s (x:xs) =
  if x >= 2
  then (s-(x-2)+2):(chk s xs)
  else (chk s xs)

ans' :: [Int] -> String
ans' l =
  let s = sum $ map (\x -> if x >= 1 then 1 else 0) l
      r = map (\x -> if x >= 1 then x-1 else 0) l
  in
    if nub(r) /= [0]
    then show (s+1)
    else "NA"

ans ("0":_) = []
ans (_:l:s) =
  let i = map read $ words l :: [Int]
      o = ans' i
  in
    o:(ans s)
    
main = do
  c <-getContents
  let i = lines c
      o = ans i
  mapM_ putStrLn o

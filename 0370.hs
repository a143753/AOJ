import Data.List

ans' [y1,m1,d1] [y2,m2,d2] =
  if [m1,d1] <= [m2,d2]
  then y1 - y2
  else y1 - y2 + 1

ans x =
  let [d1,d2] = reverse $ sort x -- d1 > d2
  in
    ans' d1 d2

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  print o

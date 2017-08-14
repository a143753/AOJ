import Data.List

cal m [] = 0
cal m l =
  let v = sum $ take (m-1) l
      r = drop m l
  in
    v + cal m r

ans :: [[Int]] -> [Int]
ans ([0,0]:_) = []
ans (x:y:xs) =
  let [n,m] = x
      v = cal m $ reverse $ sort y
  in
    (v:ans xs)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o

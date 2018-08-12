ans' x =
  let a = (sum x) `div` (length x)
  in
    length $ filter (<= a) x

ans ([0]:_) = []
ans (x0:x1:xs) = 
  let a = ans' x1
  in
    a:(ans xs)

main = do
  c <- getContents
  let i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  mapM_ print o

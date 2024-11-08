ans' (l:[]) = []
ans' ([x0,y0]:[x1,y1]:ls) =
  let dx = x1 - x0
      dy = y1 - y0
      a  = if dx*dy > 0
           then maximum [abs(dx), abs(dy)]
           else abs(dx) + abs(dy)
  in
    a:(ans' ([x1,y1]:ls))

ans x = sum $ ans' x

main = do
  l <- getLine
  c <- getContents
  let [w,h,n] = map read $ words l :: [Int]
      i = map (map read) $ map words $ lines c :: [[Int]]
      o = ans i
  print o
